
An experiment to show how you can embed roc as a script into a rust applciation.

**Requires zig version 0.11.0** (at least until [the zig upgrade PR](https://github.com/roc-lang/roc/pull/6921) merges)

First we pre-build the host which is required (until we have effect inerpreters) to provide the roc symbols like roc_alloc, roc_realloc, etc...
```sh
$ zig build-lib -dynamic -lc host/host.zig
```

Then we can compile, link, load and run our script from within our rust application.

```sh
$ cargo run -- example-script.roc libhost.dylib
INFO: Generating dylib from roc script example-script.roc
0 errors and 0 warnings found in 210 ms
 while successfully building:

    example-script
INFO: Loading dylib from liblinked.dylib
[src/main.rs:90:5] roc_str = "The number 42 is the ultimate answer!"
```
