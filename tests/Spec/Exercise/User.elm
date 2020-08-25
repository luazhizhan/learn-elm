module Spec.Exercise.User exposing (suite)

import Expect
import Test exposing (Test, describe, test)


suite : Test
suite =
    Test.skip <|
        describe "User"
            [ test "something" <|
                \_ -> Expect.equal 1 2
            ]
