
Just an experiment to build roc and then call the dylib from rust.

```sh
$ cargo run -- example-script.roc host/main.zig
INFO: Generating dylib from roc script example-script.roc
0 errors and 0 warnings found in 269 ms
 while successfully building:

    example-script
INFO: Linking example-script.roc with host/main.zig to provide roc required symbols
INFO: Loading dylib from host/libplugin.a
[src/main.rs:99:5] roc_str = "Hello"
```

I expected this to print `"World"` instead... something isn't right.
