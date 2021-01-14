module Exercise.Lists exposing (remove)

{-| List Exercises
-}


{-| Trainer's demo
Write an increment function
Write an decrement function
Write an isEven function
Transform a list using map and filter

    [ 1, 2, 3, 4, 5 ]
        |> List.map increment
        |> List.map decrement
        |> List.filter (\n -> modBy 2 n == 0)

-}
listValues : List Int
listValues =
    [ 1
    , 2
    , 3
    , 4
    ]


{-| Trainer's demo
Write a function to remove the first occurrence of a value from a list.
-}
remove : a -> List a -> List a
remove element list =
    -- Your implementation here
    list
