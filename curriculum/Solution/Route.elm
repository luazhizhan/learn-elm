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
        "" :: "" :: _ ->
            Home

        "" :: "index" :: _ ->
            Home

        "" :: "about-us" :: _ ->
            AboutUs

        "" :: "topic" :: topicTitle :: _ ->
            Topic topicTitle

        "" :: "blog" :: blogNumber :: _ ->
            case String.toInt blogNumber of
                Nothing ->
                    Unknown

                Just id ->
                    Blog id

        "" :: "user" :: userName :: [] ->
            User userName

        "" :: "user" :: userName :: "comment" :: commentID :: _ ->
            case String.toInt commentID of
                Nothing ->
                    Unknown

                Just id ->
                    Comment userName id

        _ ->
            Unknown
