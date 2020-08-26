module Spec.Exercise.Route exposing (suite)

import Exercise.Route exposing (Route(..), toRoute)
import Expect
import Test exposing (Test, describe, test)


suite : Test
suite =
    Test.skip <|
        describe "toRoute"
            [ test "Returns Topic \"general\" for /topic/general" <|
                \_ -> Expect.equal (Topic "general") (toRoute "/topic/general")
            ]
