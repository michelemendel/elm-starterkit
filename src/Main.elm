module Main exposing (..)

import Debug exposing (log)
import Html exposing (Html, div, text, input)
import Html.Attributes exposing (style, class, placeholder, value)
import Html.Events exposing (onInput)
import Model exposing (Model, initialModel)
import Platform.Cmd
import String


main : Program String Model Msg
main =
    Html.programWithFlags
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }


init : String -> ( Model, Cmd Msg )
init flags =
    ( initialModel, initialCmd )


initialCmd : Cmd Msg
initialCmd =
    Cmd.none



-- UPDATE


type Msg
    = Name String
    | Password String
    | PasswordAgain String



-- update : Msg -> Model -> Model


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    let
        a =
            log (toString model.name) 0
    in
        case msg of
            Name name ->
                ( { model | name = name }, Cmd.none )

            Password password ->
                ( { model | password = password }, Cmd.none )

            PasswordAgain password ->
                ( { model | password = password }, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    div
        []
        [ (text "Name: ")
        , input [ placeholder "Name", onInput Name, value model.name ] []
        , div [ class "rev-string" ] [ text (String.reverse model.name) ]
        ]


revStyle : ( String, String ) -> Html.Attribute msg
revStyle ( color, bgColor ) =
    style [ ( "color", color ), ( "backgroundColor", bgColor ) ]
