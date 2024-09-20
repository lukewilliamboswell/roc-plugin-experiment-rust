use core::ffi::c_void;
use libloading::Library;
use roc_std::RocStr;

fn main() {
    let args: Vec<String> = std::env::args().collect();
    if args.len() != 3 {
        eprintln!("Usage: {} <plugin.roc> <libhost.dylib>", args[0]);
        std::process::exit(1);
    }

    // the .roc script source file we want to compile and run
    let script_path = std::path::Path::new(&args[1]);

    // the host dylib was prebuilt with `zig build-lib -dynamic host/host.zig`
    let host_dylib_path = std::path::Path::new(&args[2]);

    // check host dylib exists
    if !host_dylib_path.exists() {
        eprintln!(
            "ERROR: Unable to find host dylib at {}",
            host_dylib_path.display()
        );
        std::process::exit(1);
    }

    // the output from `roc build --lib`
    #[cfg(target_os = "linux")]
    let libscript = script_path.with_extension("so");

    #[cfg(target_os = "macos")]
    let libscript = script_path.with_extension("dylib");

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

    #[cfg(target_os = "linux")]
    let linked_dylib_path = host_dylib_path
        .with_file_name("liblinked")
        .with_extension("so");

    #[cfg(target_os = "macos")]
    let linked_dylib_path = host_dylib_path
        .with_file_name("liblinked")
        .with_extension("dylib");

    // link the host dylib and the script dylib to provide the roc required symbols like
    // `roc_alloc`, `roc_realloc`, `roc_dealloc` -- this shouldn't be needed in the future
    // when we have effect interepreters
    std::process::Command::new("zig")
        .arg("build-lib")
        .arg("-dynamic")
        .arg("-lc")
        .arg(libscript.to_str().unwrap())
        .arg(host_dylib_path.to_str().unwrap())
        .arg(format!(
            "-femit-bin={}",
            linked_dylib_path.to_str().unwrap()
        ))
        .status()
        .unwrap();

    println!("INFO: Loading dylib from {}", linked_dylib_path.display());
    let dylib = unsafe { Library::new(linked_dylib_path) }.unwrap();

    // The platform API
    type MainForHost = unsafe extern "C" fn(*mut roc_std::RocStr, u64);

    let main_for_host: libloading::Symbol<MainForHost> = unsafe {
        dylib
            .get("roc__mainForHost_1_exposed_generic".as_bytes())
            .unwrap_or_else(|_| {
                panic!("Unable to load glue function roc__mainForHost_1_exposed_generic")
            })
    };

    // allocate space for roc to write into
    let mut roc_str = RocStr::empty();

    unsafe { main_for_host(&mut roc_str, 42) };

    // let's just print the roc string we got back
    dbg!(roc_str);
}

// these are required for roc_std
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
