module Exercise.User exposing (Gender(..), User, ValidateUser(..), create, findByEmail, findByName, getFemaleUsers, updateEmail)

{-| This is a multi-part exercise centering around the User type
Please follow the trainer's instruction.
-}


type Gender
    = Female
    | Male


type ValidateUser
    = InvalidEmail
    | InvalidName
    | InvalidAge


type alias User =
    { name : String
    , email : String
    , age : Int
    , gender : Maybe Gender
    }


{-| Write a function named create to create a user

    cindy : User
    cindy =
        create "Cindy" "cindy@example.com" 22

-}
create : String -> String -> Int -> Maybe Gender -> Result ValidateUser User
create name email age gender =
    let
        user =
            { name = name, email = email, age = age, gender = gender }
    in
    validate user


{-| Write a function named updateEmail to update a user's email

    updatedCindy : User
    updatedCindy =
        updateEmail "newCindy@example.com" cindy

-}
updateEmail : String -> User -> User
updateEmail email user =
    { user | email = email }


{-| Trainer's demostration
Write a function to find a user by name from a list of User
There is no find function in Elm Core List
-}
findByName : String -> List User -> Maybe User
findByName name users =
    case users of
        [] ->
            Nothing

        user :: rest ->
            if user.name == name then
                Just user

            else
                findByName name rest


{-| Write a function named findByEmail to find a user by email from a list of User

    cindy : User
    cindy =
      findByEmail "cindy@example.com" <|
        [
          { name: "Mary", email: "mary@example.com", age: 22 },
          { name: "Cindy", email: "cindy@example.com", age: 26 },
          { name: "Miya", email: "miya@example.com", age: 28 },
          ]

-}
findByEmail : String -> List User -> Maybe User
findByEmail email users =
    case users of
        [] ->
            Nothing

        user :: rest ->
            if user.email == email then
                Just user

            else
                findByEmail email rest


{-| Add a Maybe gender field to User type
Write a function that returns all female users
Ignore users who does not have gender
-}
getFemaleUsers : List User -> List User
getFemaleUsers users =
    case users of
        [] ->
            []

        user :: rest ->
            case user.gender of
                Just Female ->
                    user :: getFemaleUsers rest

                Just Male ->
                    getFemaleUsers rest

                Nothing ->
                    getFemaleUsers rest



-- User Validations
-- Write a function to validate user name is more than 10 characters


validateName : User -> Result ValidateUser User
validateName user =
    if String.length user.name > 10 then
        Err InvalidName

    else
        Ok user



-- Write a function to validate user email contains '@'


validateEmail : User -> Result ValidateUser User
validateEmail user =
    if String.contains "@" user.email then
        Ok user

    else
        Err InvalidEmail



-- Write a function to validate user age is >= 18


validateAge : User -> Result ValidateUser User
validateAge user =
    if user.age >= 18 then
        Ok user

    else
        Err InvalidAge



-- Write a function to validate a user


validate : User -> Result ValidateUser User
validate user =
    validateName user
        |> Result.andThen validateEmail
        |> Result.andThen validateAge



-- Update create function to return a Result String User
-- Finally,
-- is String a good type for Result.Err?
-- How can we design the type for Result.Err?
