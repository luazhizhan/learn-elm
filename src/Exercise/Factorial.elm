module Exercise.Factorial exposing (factorial)

{-| Write a recursive implementation of the factorial function.
Recall that `n! = 1 x 2 x … x n`, with the special case that `0! = 1`.
-}


factorial : Int -> Int
factorial n =
    -- Your implementation here
    if n < 1 then
        1

    else
        n * factorial (n - 1)
