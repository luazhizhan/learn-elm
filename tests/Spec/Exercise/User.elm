module Spec.Exercise.User exposing (suite)

import Exercise.User exposing (Gender(..), User, ValidateUser(..), create, findByEmail, getFemaleUsers, updateEmail)
import Expect
import Test exposing (Test, describe, test)


suite : Test
suite =
    let
        mary =
            User "mary" "mary@gmail.com" 18 (Just Female)

        users =
            [ User "mary" "mary@gmail.com" 18 (Just Female)
            , User "thomas" "thomas@gmail.com" 18 (Just Male)
            , User "henry" "henry@gmail.com" 18 Nothing
            ]

        femaleUsers =
            [ User "mary" "mary@gmail.com" 18 (Just Female) ]
    in
    describe "User"
        [ test "create user" <|
            \_ -> Expect.equal (Ok mary) (create "mary" "mary@gmail.com" 18 (Just Female))
        , test "create user with long name" <|
            \_ -> Expect.equal (Err InvalidName) (create "marygraeharehersfwegew" "mary@gmail.com" 18 (Just Female))
        , test "create user with invalid email" <|
            \_ -> Expect.equal (Err InvalidEmail) (create "mary" "mary-gmail.com" 18 (Just Female))
        , test "create user with invalid age" <|
            \_ -> Expect.equal (Err InvalidAge) (create "mary" "mary@gmail.com" 13 (Just Female))
        , test "Update email" <|
            \_ -> Expect.equal "mary-jane@gmail.com" (updateEmail "mary-jane@gmail.com" mary |> .email)
        , test "Find julian" <|
            \_ -> Expect.equal Nothing (findByEmail "julian@gmail.com" users)
        , test "Find thomas" <|
            \_ -> Expect.equal (Just <| User "thomas" "thomas@gmail.com" 18 (Just Male)) (findByEmail "thomas@gmail.com" users)
        , test "Find female user" <|
            \_ -> Expect.equal femaleUsers (getFemaleUsers users)
        ]
