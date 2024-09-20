use core::ffi::c_void;
use libloading::Library;
use roc_std::RocStr;

#[no_mangle]
pub unsafe extern "C" fn roc_alloc(size: usize, _alignment: u32) -> *mut c_void {
    libc::malloc(size)
}

#[no_mangle]
pub unsafe extern "C" fn roc_realloc(
    c_ptr: *mut c_void,
    new_size: usize,
    _old_size: usize,
    _alignment: u32,
) -> *mut c_void {
    libc::realloc(c_ptr, new_size)
}

#[no_mangle]
pub unsafe extern "C" fn roc_dealloc(c_ptr: *mut c_void, _alignment: u32) {
    libc::free(c_ptr)
}

fn main() {
    let args: Vec<String> = std::env::args().collect();
    if args.len() != 3 {
        eprintln!("Usage: {} <file_path> <host/main.zig>", args[0]);
        std::process::exit(1);
    }

    let script_path = std::path::Path::new(&args[1]);
    let host_path = std::path::Path::new(&args[2]);

    // the output from `roc build --lib`
    let libscript = script_path.with_extension("dylib");

    // the output from `zig build-lib` linking the platform host
    let libplugin = host_path.with_file_name("libplugin").with_extension("a");

    println!(
        "INFO: Generating dylib from roc script {}",
        script_path.display()
    );
    std::process::Command::new("roc")
        .arg("build")
        .arg("--lib")
        .arg(script_path.to_str().unwrap())
        .status()
        .unwrap();

    // check libscript exists
    if !libscript.exists() {
        eprintln!("ERROR: Unable to find libscript at {}", libscript.display());
        std::process::exit(1);
    }

    println!(
        "INFO: Linking {} with {} to provide roc required symbols",
        script_path.display(),
        host_path.display(),
    );

    // zig build-lib host/main.zig example-script.dylib
    std::process::Command::new("zig")
        .arg("build-lib")
        .arg("-lc") // link libc
        .arg("-dynamic") // dynamic library
        .arg(format!("-femit-bin={}", libplugin.to_str().unwrap()))
        .arg(host_path.to_str().unwrap())
        .arg(libscript.to_str().unwrap())
        .status()
        .unwrap();

    // check libplugin exitsts
    if !libplugin.exists() {
        eprintln!("ERROR: Unable to find libplugin at {}", libplugin.display());
        std::process::exit(1);
    }

    println!("INFO: Loading dylib from {}", libplugin.display());
    let dylib = unsafe { Library::new(libplugin) }.unwrap();

    type MainForHost = unsafe extern "C" fn(*mut roc_std::RocStr);

    let main_for_host: libloading::Symbol<MainForHost> = unsafe {
        dylib
            .get("roc__mainForHost_1_exposed_generic".as_bytes())
            .unwrap_or_else(|_| {
                panic!("Unable to load glue function roc__mainForHost_1_exposed_generic")
            })
    };

    // allocate space for roc to write into
    let mut roc_str = RocStr::from("Hello");

    unsafe { main_for_host(&mut roc_str) };

    dbg!(roc_str);
}
