module Spec.Exercise.FormatCents exposing (suite)

import Exercise.FormatCents exposing (formatCents)
import Expect
import Test exposing (Test, describe, test)


suite : Test
suite =
    Test.skip <|
        describe "formatCents"
            [ test "Formats 1250" <|
                \_ -> Expect.equal "$12.50" (formatCents 1250)
            , test "Formats 100" <|
                \_ -> Expect.equal "$1.00" (formatCents 100)
            , test "Formats 20" <|
                \_ -> Expect.equal "$0.20" (formatCents 20)
            , test "Formats 1" <|
                \_ -> Expect.equal "$0.01" (formatCents 1)
            , test "Formats 0" <|
                \_ -> Expect.equal "$0.00" (formatCents 0)
            ]
