module Main exposing (Model, Msg(..), init, main, update, view)

import Browser
import Css exposing (..)
import DateFormat
import Html.Styled exposing (Html, button, div, form, img, input, label, span, text, toUnstyled)
import Html.Styled.Attributes exposing (css, for, src, type_, value)
import Html.Styled.Events exposing (onClick, onInput)
import Http
import Json.Decode exposing (Decoder, field, string)
import Random
import Task
import Time



-- MAIN


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = \_ -> Time.every 1000 Tick
        , view = view >> toUnstyled
        }



-- MODEL


type ApiResponse
    = Ready
    | Loading
    | Success String
    | Fail String


type alias Model =
    { stepper : Int
    , name : String
    , email : String
    , age : Int
    , image : ApiResponse
    , diceFace : Int
    , food : String
    , zone : Time.Zone
    , time : Time.Posix
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( { stepper = 0
      , name = ""
      , email = ""
      , age = 18
      , image = Ready
      , diceFace = 1
      , food = "Select random food"
      , zone = Time.utc
      , time = Time.millisToPosix 0
      }
    , Task.perform AdjustTimeZone Time.here
    )



-- UPDATE


foodList : ( String, List String )
foodList =
    ( "a", [ "b", "c", "d", "e", "f" ] )


type Msg
    = Increment
    | Decrement
    | Name String
    | Email String
    | Age String
    | LoadImage
    | GotImg (Result Http.Error String)
    | Roll
    | NewFace Int
    | RollFood
    | NewFood String
    | Tick Time.Posix
    | AdjustTimeZone Time.Zone
    | Reset


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increment ->
            ( { model | stepper = model.stepper + 1 }, Cmd.none )

        Decrement ->
            ( { model | stepper = model.stepper - 1 }, Cmd.none )

        Name newName ->
            ( { model | name = newName }, Cmd.none )

        Email newEmail ->
            ( { model | email = newEmail }, Cmd.none )

        Age newAge ->
            case String.toInt newAge of
                Nothing ->
                    ( model, Cmd.none )

                Just age ->
                    ( { model | age = age }, Cmd.none )

        LoadImage ->
            ( { model | image = Loading }, getImgPlaceholder )

        GotImg result ->
            case result of
                Ok url ->
                    ( { model | image = Success url }, Cmd.none )

                Err _ ->
                    ( { model | image = Fail "Failed to get image" }, Cmd.none )

        Roll ->
            ( model, Random.generate NewFace (Random.int 1 6) )

        NewFace newFace ->
            ( { model | diceFace = newFace }, Cmd.none )

        RollFood ->
            ( model, Random.generate NewFood (Random.uniform (Tuple.first foodList) (Tuple.second foodList)) )

        NewFood food ->
            ( { model | food = food }, Cmd.none )

        Tick newTime ->
            ( { model | time = newTime }
            , Cmd.none
            )

        AdjustTimeZone newZone ->
            ( { model | zone = newZone }
            , Cmd.none
            )

        Reset ->
            ( { model | stepper = 0 }, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ span [ css styles.spanBlock ] [ text (String.fromInt model.stepper) ]
        , div [ css styles.ctrlBtns ]
            [ button [ onClick Decrement ] [ text "-" ]
            , button [ onClick Increment ] [ text "+" ]
            ]
        , button [ onClick Reset, css styles.resetBtn ] [ text "Reset" ]
        , form [ css styles.form ]
            [ -- Name
              label [ for "name", css styles.formLabel ] [ text "Name:" ]
            , input [ value model.name, type_ "text", css styles.formInput, onInput Name ] []

            -- Email
            , label [ for "email", css styles.formLabel ] [ text "Email:" ]
            , input [ value model.email, type_ "email", css styles.formInput, onInput Email ] []

            -- Age
            , label [ for "age", css styles.formLabel ] [ text "Age:" ]
            , input [ value (String.fromInt model.age), type_ "number", css styles.formInput, onInput Age ] []
            ]
        , button [ onClick LoadImage ] [ text "Load Image" ]
        , viewImg model.image
        , div []
            [ span [ css styles.spanBlock ] [ text (String.fromInt model.diceFace) ]
            , button [ onClick Roll ] [ text "Roll Dice" ]
            ]
        , div []
            [ span [ css styles.spanBlock ] [ text model.food ]
            , button [ onClick RollFood ] [ text "Roll food" ]
            ]
        , span [ css styles.spanBlock ] [ text (formatStr model.zone model.time) ]
        ]


viewImg : ApiResponse -> Html Msg
viewImg apiRes =
    case apiRes of
        Ready ->
            img [ src "", css styles.placeholderImg ] []

        Loading ->
            span [ css styles.loadingText ] [ text "Loading.." ]

        Success url ->
            img [ src url, css styles.placeholderImg ] []

        Fail msg ->
            text msg


formatStr : Time.Zone -> Time.Posix -> String
formatStr =
    DateFormat.format
        [ DateFormat.dayOfMonthSuffix
        , DateFormat.text " "
        , DateFormat.monthNameAbbreviated
        , DateFormat.text " "
        , DateFormat.yearNumber
        , DateFormat.text " "
        , DateFormat.hourFixed
        , DateFormat.text ":"
        , DateFormat.minuteFixed
        , DateFormat.text ":"
        , DateFormat.secondFixed
        , DateFormat.text " "
        , DateFormat.amPmUppercase
        ]


styles =
    { spanBlock =
        [ display block
        , height (px 50)
        , marginTop (em 1)
        , fontSize (em 2)
        ]
    , ctrlBtns =
        [ displayFlex
        , justifyContent spaceBetween
        , width (px 200)
        , margin2 (px 0) auto
        , alignItems center
        ]
    , resetBtn =
        [ marginTop (em 2)
        ]
    , form =
        [ displayFlex
        , maxWidth fitContent
        , flexDirection column
        , margin2 (em 2) auto
        ]
    , formLabel =
        [ textAlign left
        , marginBottom (px 5)
        ]
    , formInput =
        [ marginBottom (em 1)
        ]
    , placeholderImg =
        [ display block
        , margin2 (em 1) auto
        ]
    , loadingText =
        [ fontWeight lighter
        , display block
        , marginTop (em 1)
        ]
    }



-- HTTP


getImgPlaceholder : Cmd Msg
getImgPlaceholder =
    Http.get
        { url = "https://api.giphy.com/v1/gifs/random?api_key=VmlkaGyNEEViGtkW87GL2voKr2h4GGMo&tag=cat"
        , expect = Http.expectJson GotImg gifDecoder
        }


gifDecoder : Decoder String
gifDecoder =
    field "data" (field "image_url" string)
