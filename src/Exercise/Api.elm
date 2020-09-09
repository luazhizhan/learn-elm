module Exercise.Api exposing (Response, displayResponse)

{-| Api Exercises
-}


type Response
    = What
    | Are
    | The
    | Different
    | Type
    | Variants


{-| Given a Response,
return "Loading" if it is loading,
return "Loaded" if it is successful,
return "Error" if it is unsuccessful
-}
displayResponse : Response -> String
displayResponse _ =
    "Your implementation here"

