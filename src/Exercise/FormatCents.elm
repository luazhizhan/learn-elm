module Exercise.FormatCents exposing (formatCents)

import String


{-| Write a function that formats money from int to string
Examples:
formatCents 1250 == "$12.50"
formatCents 100 == "$1.00"
formatCents 9999 == "$99.99"

Assume that int will always be >= 0

Hint:
Check out String.dropRight and String.padLeft in
<https://package.elm-lang.org/packages/elm/core/latest/String>

-}
formatCents : Int -> String
formatCents moneyInCents =
    let
        moneyStr =
            String.fromInt moneyInCents
    in
    if moneyInCents < 1 then
        "$0.00"

    else if moneyInCents < 10 then
        "$0.0" ++ moneyStr

    else if moneyInCents < 100 then
        "$0." ++ moneyStr

    else
        "$" ++ String.dropRight 2 moneyStr ++ "." ++ String.right 2 moneyStr
