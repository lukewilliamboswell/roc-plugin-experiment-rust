app [main] { pf: platform "platform/main.roc" }

main : U64 -> Str
main = \fromHost -> "The number $(Num.toStr fromHost) is the ultimate answer!"
