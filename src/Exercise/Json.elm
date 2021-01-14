module Exercise.Json exposing (decodeID)

import Json.Decode as JD exposing (Decoder)


{-| Json Exercises
Json Data taken from:
<https://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC&tag=cat>
-}
decodeID : Decoder String
decodeID =
    JD.field "data" (JD.field "id" JD.string)



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
