module Main exposing (Model, Msg(..), main, update, view)

import Browser exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }



-- Model


type alias Model =
    { message : String
    }


init : Model
init =
    { message = "hello"
    }



-- UPDATE


type Msg
    = SayHello String
    | SayBye


update : Msg -> Model -> Model
update msg model =
    case msg of
        SayHello greeted ->
            { model | message = "hello " ++ greeted }

        SayBye ->
            { model | message = "bye!" }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick (SayHello "hello") ] [ text "hello" ]
        , button [ onClick SayBye ] [ text "bye" ]
        , span [ class "red" ] [ text model.message ]
        ]
