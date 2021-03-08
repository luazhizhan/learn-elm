module Spec.Exercise.Factorial exposing (suite)

import Exercise.Factorial exposing (factorial)
import Expect
import Test exposing (Test, describe, test)


suite : Test
suite =
    describe "factorial"
        [ test "Returns 1 for factorial 0"
            (\_ -> Expect.equal 1 (factorial 0))
        , test "Returns 24 for factorial 4"
            (\_ -> Expect.equal 24 (factorial 4))
        ]
