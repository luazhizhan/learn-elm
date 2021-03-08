module Spec.Exercise.Strings exposing (suite)

import Exercise.Strings exposing (format)
import Expect
import Test exposing (Test, describe, test)


suite : Test
suite =
    describe "format"
        [ test "Formats \"elm/ is/fun /to/write!\"" <|
            \_ -> Expect.equal "ELM IS FUN TO WRITE!" (format "elm/ is/fun /to/write!")
        , test "Formats \"hello/world\"" <|
            \_ -> Expect.equal "HELLO WORLD" (format "hello/world")
        ]
