module Spec.Exercise.Lists exposing (suite)

import Exercise.Lists exposing (remove)
import Expect
import Test exposing (Test, describe, test)


suite : Test
suite =
    Test.skip <|
        describe "remove"
            [ test "Remove first element" <|
                \_ -> Expect.equal [ 2, 3 ] (remove 1 [ 1, 2, 3 ])
            ]
