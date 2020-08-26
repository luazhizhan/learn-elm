# Learn Elm!
Read `https://guide.elm-lang.org/`
with the below additional notes for each section

The focus is on mastering syntax first before learning The Elm Architecture.

For all excerises, inform the student to create a new file in `/src/Excerise/NewFile.elm` and a corresponding test case in `/tests/Spec/Excerise/NewFile.elm`

## Introduction
- Open mind to learn a new language
- Explain the little program line by line
- Explain function update msg model
- Every function only returns one value
- Immutability
- What is a Type? A type is a kind of contract between a variable and a compiler. It tells the compiler what is the kind of a variable and it allows the compiler to enforce rules upon the variable's kind eg. cannot call .length on an Int variable
- No classes in Elm
- All functions are 100% PURE

## Core Language

### Values
Don't use the interactive on the website
Ask student to clone this repo
Ensure IDE is setup properly
Walkthrough `/tests/Tests.elm` 
and explain 
- module/import/export
- let..in 
- back piping
- `_ = Debug.log "title" value`

Introduce elm core reference:
`https://package.elm-lang.org/packages/elm/core/latest/String`
`https://elm-lang.org/docs/syntax`
Explain a -> b -> c and the concept of currying
Explain String vs Char

Play with an example `String.length`
Do the FormatCents.elm exercise
Do the Strings.elm exercise

### Functions
### If-else
Do the Factorial.elm exercise

## Lists
Can only hold the same type for the entire list
List vs Array
Do the demo and kata in Lists.elm exercise

## Tuple
Maximum 3 values

## Records:
- Known as objects in Javascript
- Immutable
- Field type cannot be changed
Do User exercise until `findByName`

# Types
## Reading Types
- Primitives and Lists: Demo [1, "hello"]
- Functions: 
Explain a -> b -> c
String.padLeft : Int -> Char -> String -> String
String.all : (Char -> Bool) -> String -> Bool
- Type Annotation: 
We always annotate all functions and variables because it is a form of documentation
- Type Variables: 
Explain List.map : (a -> b) -> List a -> List b
Explain List.range : Int -> Int -> List Int
- Skip constrained type variables

## Type Aliases:
Use type alias Email = String in User exercise

## Custom Types
## Pattern Matching
Go through these 2 sections together
Do Api exercise
Do Route exercise

# Error Handling
## Maybe
Do from  `findByName` to `getFemaleUsers` in User exercise
```elm
-- Discuss Maybe Type vs Custom Type
type VerifiedStatus =
    Pending
    | Approved
    | Rejected

type alias User = {
    verifiedStatus: Maybe VerifiedStatus
}
```

## Result
Do only `validate` in User exercise
Guide students to think about function composition
Guide students to think about handling String as error
Hidden exercise:
Write a function named errorMessage : ErrorCode -> String
where 
`type ErrorCode = InvalidEmail | InvalidName | InvalidAge`

- Making impossible state impossible: `https://www.youtube.com/watch?v=IcgmSRJHu_8`

# The Elm Architecture
## Buttons
Create a file `/src/Main.elm` and copy the example code
Run `npm start`
Student can view localhost:3000 to play with the app

Do the exercise: Add a button to reset the counter to zero:

## Text Fields
Ask student to add the code in current app
so they can understand better

## Forms
Ask student to add the code in current app
so they can understand better

# Commands and Subscriptions
## HTTP
Tell student to implement a button "Load Image"
and then it will call the HTTP to load an image.

Work with the student to create the ApiResponse type first
type ApiResponse =
  Ready
  | Loading
  | Success String
  | Fail String

## JSON
- Ask student to install `elm-app install elm/json`
Do Json exercise
- Ask student to change the "Load Image" button to load the cat image and also to show more fields of the returned data
- Install `NoRedInk/elm-json-decode-pipeline` and use it to decode

## Random
Discuss why Random is considered a side-effect?
Ask student to create a button that roll 1 to 6

## Time
Discuss why Time is considered a side-effect?
Ask student to display current date and time
Install `ryannhg/date-format` to format the date

# JavaScript Interop
Go through it quickly

# Web Apps
## Navigation
Ask student to update the app to have the following pages:
- /
- /index
- /about
- /register
Inform student to refer to their Route exercise

## URL Parsing
We don't use this package
but students are free to learn it themselves

## Modules
## Structure
To discuss with students
Using User exercise, share with student the idea of Data Type files

# Final Exercise:
- Register a user with an API
- Name, Email, Password, Gender (optional)
- Display emall is taken error
- Display user is registered successfully

* An API for Registeration?
https://exercism.io/tracks/elm

# Additional Readings
- https://elm-lang.org/docs/syntax
- Opaque Types: `https://medium.com/@ghivert/designing-api-in-elm-opaque-types-ce9d5f113033`
- Phantom Types: `https://thoughtbot.com/blog/modeling-currency-in-elm-using-phantom-types`
