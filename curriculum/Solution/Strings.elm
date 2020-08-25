module Exercise.Strings exposing (format)

{-| Write a function that formats a string from
"elm/ is/fun /to/write!" to "ELM IS FUN TO WRITE!"
Hint: You need to split the string, trim out the white spaces, join them back and uppercase it.
-}


format : String -> String
format string =
    String.split "/" string
        |> List.map String.trim
        |> String.join " "
        |> String.toUpper
