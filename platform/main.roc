platform "example-plugin"
    requires {} { main : U64 -> Str }
    exposes []
    packages {}
    imports []
    provides [mainForHost]

mainForHost : U64 -> Str
mainForHost = \x -> main x
