module Exercise.ApiResponse exposing (Response, displayResponse)

{-| This is a multi-part exercise centering around the User type
Please follow the trainer's instruction.
-}


type Response
    = What
    | Are
    | The
    | Different
    | Type
    | Variants


{-|

    Given a Response,
    return "Loading" if it is loading,
    return "Loaded" if it is successful,
    return "Error" if it is unsuccessful

-}
displayResponse : Response -> String
displayResponse _ =
    "Your implementation here"
