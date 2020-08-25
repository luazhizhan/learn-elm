module Tests exposing (suite)

import Expect
import Hello exposing (hello)
import Test exposing (Test, test)


suite : Test
suite =
    test "Learn Elm is Working" learnElmIsWorking


learnElmIsWorking : () -> Expect.Expectation
learnElmIsWorking _ =
    let
        result =
            hello "World"
    in
    Expect.equal "Hello, World" result
