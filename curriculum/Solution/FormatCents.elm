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
    let
        moneyString =
            if moneyInCents < 0 then
                "0"

            else
                String.fromInt moneyInCents

        cents =
            String.right 2 moneyString
                |> String.padLeft 2 '0'

        dollars =
            String.dropRight 2 moneyString
                |> String.padLeft 1 '0'
    in
    "$" ++ dollars ++ "." ++ cents
