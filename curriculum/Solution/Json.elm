module Exercise.Json exposing (FileType(..), GiphyImage, decodeGiphyImage)

import Json.Decode as JD exposing (Decoder)


type alias GiphyImage =
    { id : String
    , fileType : FileType
    , title : String
    , imageUrl : String
    , caption : String
    }


type FileType
    = Jpg
    | Gif
    | Png


decodeGiphyImage : Decoder GiphyImage
decodeGiphyImage =
    JD.field "data" <|
        JD.map5 GiphyImage
            (JD.field "id" JD.string)
            (JD.field "type" decodeFileType)
            (JD.field "title" JD.string)
            (JD.field "image_url" JD.string)
            (JD.field "caption" JD.string)


decodeFileType : Decoder FileType
decodeFileType =
    JD.string
        |> JD.andThen
            (\fileTypeString ->
                case fileTypeString of
                    "gif" ->
                        JD.succeed Gif

                    "jpg" ->
                        JD.succeed Jpg

                    "png" ->
                        JD.succeed Png

                    _ ->
                        JD.fail <| "Unknown file type: " ++ fileTypeString
            )
