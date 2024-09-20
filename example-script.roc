app [main] { pf: platform "platform/main.roc" }

main : Str -> Str
main = \input -> Str.concat input ", app!"
