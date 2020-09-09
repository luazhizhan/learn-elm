module Exercise.User exposing (User, create, updateEmail)

{-| This is a multi-part exercise centering around the User type
Please follow the trainer's instruction.
-}


type alias User =
    { name : String
    , email : String
    , age : Int
    }


{-| Write a function named create to create a user

    cindy : User
    cindy =
        create "Cindy" "cindy@example.com" 22

-}
create : String
create =
    "Write your implementation with Type Annotation"


{-| Write a function named updateEmail to update a user's email

    updatedCindy : User
    updatedCindy =
        updateEmail "newCindy@example.com" cindy

-}
updateEmail : String
updateEmail =
    "Write your implementation with Type Annotation"


{-| Trainer's demostration
Write a function to find a user by name from a list of User
There is no find function in Elm Core List
-}
findByName : String
findByName =
    "Write your implementation with Type Annotation"


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
findByEmail : String
findByEmail =
    "Write your implementation with Type Annotation"


{-| Add a Maybe gender field to User type
Write a function that returns all female users
Ignore users who does not have gender
-}
getFemaleUsers : List User -> List User
getFemaleUsers users =
    users


                _ ->
                    getFemaleUsers rest



{- User Validations

   Write a function to validate user name is more than or equal to 3 characters
   validateName : User -> Result String User

   Write a function to validate user email contains '@'
   validateEmail : User -> Result String User

   Write a function to validate user age is >= 18
   validateAge : User -> Result String User

   Write a function to validate a user
   validate : User -> Result String User

   Update create function to return a Result String User

   Finally,
   is String a good type for Result.Err?
   How can we design the type for Result.Err?

-}
