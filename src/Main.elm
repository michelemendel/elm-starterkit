module Main exposing (..)

-- import Debug exposing (log)

import Html exposing (Html, Attribute, a, button, div, h4, input, p, text, ul, li)
import Html.Attributes exposing (attribute, class, href, placeholder, style, type_, value, autofocus)
import Html.Events exposing (onInput, on, keyCode)
import Platform.Cmd
import Json.Decode as Json
import Bootstrap.Grid as Grid
import Bootstrap.Grid.Row as Row
import Bootstrap.Grid.Col as Col
import Model exposing (Model, initialModel)


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
    | AddItem


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UpdateField data ->
            ( { model | field = data }, Cmd.none )

        AddItem ->
            ( { model | items = model.field :: model.items, field = "" }, Cmd.none )



{--------------------------------------------------------------------------------
    View
--}


view : Model -> Html Msg
view model =
    Grid.container []
        [ Grid.row [ Row.centerXs ]
            [ Grid.col [ Col.xs12 ]
                [ text "Add new entry to log" ]
            ]
        , Grid.row [ Row.centerXs ]
            [ Grid.col [ Col.xs4 ]
                [ input
                    [ value model.field
                    , placeholder "add something"
                    , autofocus True
                    , onInput UpdateField
                    , onEnter AddItem
                    ]
                    []
                ]
            , Grid.col [ Col.xs8 ]
                [ ul []
                    (List.map (\item -> li [] [ text item ]) model.items)
                ]
            ]
        ]


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
