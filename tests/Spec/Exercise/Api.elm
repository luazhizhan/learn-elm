module Spec.Exercise.Api exposing (suite)

import Exercise.Api exposing (Response(..), displayResponse)
import Expect
import Test exposing (Test, describe, test)


suite : Test
suite =
    describe "Api"
        [ test "Loading" <| \_ -> Expect.equal "Loading" (displayResponse Loading)
        , test "Successful" <| \_ -> Expect.equal "Successful" (displayResponse Successful)
        , test "Unsuccessful" <| \_ -> Expect.equal "Unsuccessful" (displayResponse Unsuccessful)
        ]
