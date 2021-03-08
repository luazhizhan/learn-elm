module Exercise.Json exposing (FileType(..), Image, decodeID, decodeImage)

import Json.Decode as JD exposing (Decoder)


{-| Json Exercises
Json Data taken from:
<https://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC&tag=cat>
-}
decodeID : Decoder String
decodeID =
    JD.field "data" (JD.field "id" JD.string)


type alias Image =
    { id : String
    , imageUrl : String
    , viewed : Int
    , fileType : FileType
    }


type FileType
    = Gif
    | Png
    | Jpg


decodeImage : Decoder Image
decodeImage =
    JD.field "data" <|
        JD.map4 Image
            (JD.field "id" JD.string)
            (JD.field "image_url" JD.string)
            (JD.field "viewed" JD.int)
            (JD.field "type" decodeFileType)


decodeFileType : Decoder FileType
decodeFileType =
    JD.string
        |> JD.andThen
            (\fileTypeStr ->
                case fileTypeStr of
                    "gif" ->
                        JD.succeed Gif

                    "png" ->
                        JD.succeed Png

                    "jpg" ->
                        JD.succeed Jpg

                    "jpeg" ->
                        JD.succeed Jpg

                    _ ->
                        JD.fail <| "Invalid file type: " ++ fileTypeStr
            )



-- Write a decoder for data.image_url
-- Write a decoder for data.viewed
{-
     Write a decoder for
     type alias Image =
       {
         id: String,
         imageUrl: String,
         viewed: Int,
       }
     Hint: Use JD.map3 into Image type.
     Remember that Image record type is actually a function of this signature:
   String -> String -> Int -> Image
-}
