module Main exposing (..)

import Html exposing (Html, div, text, input)
import Html.Attributes exposing (style, class, placeholder, value)
import Html.Events exposing (onInput)
import Debug exposing (log)
import Platform.Cmd
import String
import Model exposing (Model, model)


main =
    Html.beginnerProgram
        { model = model
        , view = view
        , update = update
        }



-- UPDATE


type Msg
    = Name String
    | Password String
    | PasswordAgain String


update : Msg -> Model -> Model
update msg model =
    let
        a =
            log (toString model.name) 0
    in
        case msg of
            Name name ->
                { model | name = name }

            Password password ->
                { model | password = password }

            PasswordAgain password ->
                { model | password = password }



-- VIEW


view : Model -> Html Msg
view model =
    div
        []
        [ (text "Name: ")
        , input [ placeholder "Name", onInput Name, value model.name ] []
        , div [ class "rev-string" ] [ text (String.reverse model.name) ]
        ]


revStyle ( color, bgColor ) =
    style [ ( "color", color ), ( "backgroundColor", bgColor ) ]
