module Exercise.Route exposing (Route(..), toRoute)


type Route
    = Home
    | AboutUs
    | Topic String
    | User String
    | Blog Int
    | Comment String Int
    | Unknown


{-| Complete the function that converts a URL string to Route
"/" == Home
"/index" == Home
"/about-us" == AboutUs
"/topic/general" == Topic "general"
"/blog/123" == Blog 123
"/user/cindy-wee" == User "cindy-wee"
"/user/cindy-wee/comment/2" == Comment "cindy-wee" 2
"/404" == Unknown
-}
toRoute : String -> Route
toRoute url =
    -- Complete the implementation here
    case String.split "/" url of
        "" :: "topic" :: topicTitle :: _ ->
            Topic topicTitle

        _ ->
            Unknown
