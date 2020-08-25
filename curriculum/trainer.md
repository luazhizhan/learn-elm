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
Play with an example `String.length`
Explain a -> b -> c and the concept of currying
Encourage students to explore more string functions
Explain String vs Char

### Functions
### If-else
Do the Factorial.elm exercise

## Lists
Can only hold the same type for the entire list
List vs Array
Demo List.map a decrement function 
[1,2,3,4,5]
|> List.map increment
|> List.map decrement
|> List.filter (\n -> modBy 2 n == 0)

Do the FormatCents.elm exercise
Do the Strings.elm exercise

## Tuple
Maximum 3 values

## Records:
Exercise
Write a function createPerson: String -> Int -> { name: String, age: Int }

Create a list of person:
people = [
	createPerson "Steven" 39,
	createPerson "Alex" 28,
	createPerson "Mary" 34,
	createPerson "Cindy" 22
]

Write a function to return sum of all ages given a list of person: List Person -> Int

#*** SKIP THE ELM ARCHITECTURE AND GO TO TYPES FIRST ***

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
Do User exercise until `findByName`
- Explain type alias Email = String

## Custom Types
## Pattern Matching
Go through these 2 sections together
Do Api exercise

# Error Handling
## Maybe
Do from  `findByName` to `getFemaleUsers` in User exercise

## Result
Do only `validate` in User exercise
Guide students to think about function composition
Guide students to think about handling String as error
Hidden exercise:
Write a function named errorMessage : ErrorCode -> String
where 
`type ErrorCode = InvalidEmail | InvalidName | InvalidAge`

- Making impossible state impossible: `https://www.youtube.com/watch?v=IcgmSRJHu_8`
Revisit the FormatCents.elm exercise
How do you guarantee Int is always positive?

Final Exercise:
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

Advanced:
|>
<|
>>
<<
Map.map
Task.map
Result.mapError
elm-css
