module Main exposing (..)

-- import Debug exposing (log)

import Html exposing (Html, Attribute, a, button, div, h4, input, p, text, ul, li)
import Html.Attributes exposing (attribute, id, class, href, placeholder, style, type_, value, autofocus)
import Html.Events exposing (onClick, onInput, on, keyCode)
import Platform.Cmd
import Json.Decode as Json


-- Elm Bootstrap

import Bootstrap.Grid as Grid
import Bootstrap.Grid.Row as Row
import Bootstrap.Grid.Col as Col
import Bootstrap.Form as Form
import Bootstrap.Form.Input as Input
import Bootstrap.ListGroup as ListGroup


-- Application

import Model exposing (Model, Entry, initialModel)


-- Structure code: see http://blog.jenkster.com/2016/04/how-i-structure-elm-apps.html
{--------------------------------------------------------------------------------
    Hardcoded
--}
{--------------------------------------------------------------------------------
    Types and aliases
--}
{--------------------------------------------------------------------------------
    Main and Init
--}


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



{--------------------------------------------------------------------------------
    Update
--}


type Msg
    = UpdateField String
    | AddEntry
    | RemoveEntry Int


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    let
        newId =
            model.currentId + 1
    in
        case msg of
            UpdateField data ->
                ( { model | field = data }, Cmd.none )

            AddEntry ->
                ( { model
                    | entries =
                        if String.isEmpty model.field then
                            model.entries
                        else
                            Model.Entry newId model.field :: model.entries
                    , field = ""
                    , currentId = newId
                  }
                , Cmd.none
                )

            RemoveEntry id ->
                ( { model | entries = List.filter (\entry -> entry.id /= id) model.entries }, Cmd.none )



{--------------------------------------------------------------------------------
    View
--}


view : Model -> Html Msg
view model =
    div []
        [ mainContent model
        ]


mainContent : Model -> Html Msg
mainContent model =
    Grid.container []
        [ Grid.row [ Row.centerXs ]
            [ Grid.col [ Col.xs12 ] [ inputField model ]
            ]
        , Grid.row [ Row.centerXs ]
            [ Grid.col [ Col.xs12 ] [ entries model ]
            ]
        ]


inputField : Model -> Html Msg
inputField model =
    Form.group []
        [ Form.label [] [ text "Add new log entry" ]
        , Input.text
            [ Input.attrs
                [ placeholder "woke up"
                , value model.field
                , autofocus True
                , onInput UpdateField
                , onEnter AddEntry
                ]
            ]
        ]


entries : Model -> Html Msg
entries model =
    ListGroup.ul
        (List.map
            (\entry ->
                ListGroup.li
                    [ ListGroup.attrs
                        [ id (toString entry.id)
                        , onClick (RemoveEntry entry.id)
                        ]
                    ]
                    [ text entry.text
                    ]
            )
            model.entries
        )


onEnter : Msg -> Attribute Msg
onEnter msg =
    let
        isEnter code =
            if code == 13 then
                Json.succeed msg
            else
                Json.fail "not ENTER"
    in
        on "keydown" (Json.andThen isEnter keyCode)


revStyle : ( String, String ) -> Html.Attribute msg
revStyle ( color, bgColor ) =
    style [ ( "color", color ), ( "backgroundColor", bgColor ) ]



{--------------------------------------------------------------------------------
    Helper functions
--}
