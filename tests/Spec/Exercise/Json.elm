module Spec.Exercise.Json exposing (suite)

import Exercise.Json exposing (decodeID)
import Expect
import Json.Decode as JD
import Test exposing (Test, describe, test)


jsonData : String
jsonData =
    """
  {
    "data": {
      "type": "gif",
      "id": "l2JhxfHWMBWuDMIpi",
      "title": "cat love GIF by The Secret Life Of Pets",
      "image_url": "https://media1.giphy.com/media/l2JhxfHWMBWuDMIpi/giphy.gif",
      "viewed": 1287
    }
  }
"""


suite : Test
suite =
    describe "Json Decoder"
        [ test "Can decode id" <|
            \_ -> Expect.equal (Ok "l2JhxfHWMBWuDMIpi") (JD.decodeString decodeID jsonData)
        ]
