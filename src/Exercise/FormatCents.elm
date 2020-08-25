module Exercise.FormatCents exposing (formatCents)

{-| Write a function that formats money from int to string
Examples:
formatCents 1250 == "$12.50"
formatCents 100 == "$1.00"
formatCents 9999 == "$99.99"
formatCents -1 == "$0.00"

Hint:
Check out String.dropRight and String.padLeft in
<https://package.elm-lang.org/packages/elm/core/latest/String>

-}


formatCents : Int -> String
formatCents moneyInCents =
    "Your implementation here: " ++ String.fromInt moneyInCents
