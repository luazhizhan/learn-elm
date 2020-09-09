module Exercise.Route exposing (Route(..), toRoute)


type Route
    = Home
    | AboutUs
    | Topic String
    | User String
    | Comment String String
    | Unknown


{-| Complete the function that converts a URL string to Route
"/" == Home
"/index" == Home
"/about-us" == AboutUs
"/topic/general" == Topic "general"
"/topic/fun" == Topic "fun"
"/user/cindy-wee" == User "cindy-wee"
"/user/cindy-wee/comment/rxzudk231" == Comment "cindy-wee" "rxzudk231"
"/404" == Unknown
-}
toRoute : String -> Route
toRoute url =
    -- Complete the implementation here
    case String.split "/" url of
        "" :: "topic" :: t :: _ ->
            Topic t

        [ "", "User", username ] ->
            User username

        _ ->
            Unknown
