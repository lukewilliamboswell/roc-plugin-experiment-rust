app [main] { pf: platform "platform/main.roc" }

main : Str -> Str
main = \_ -> "World!"
