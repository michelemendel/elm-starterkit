module Main exposing (..)

-- import Debug exposing (log)

import Html exposing (Html, a, button, div, h4, input, p, text)
import Html.Attributes exposing (attribute, class, href, placeholder, style, type_, value)


-- import Html.Events exposing (onInput)

import Model exposing (Model, initialModel)
import Platform.Cmd


-- import String

import Bootstrap.Grid as Grid
import Bootstrap.Grid.Row as Row
import Bootstrap.Grid.Col as Col


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
    = Name String
    | Password String
    | PasswordAgain String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Name name ->
            ( { model | name = name }, Cmd.none )

        Password password ->
            ( { model | password = password }, Cmd.none )

        PasswordAgain password ->
            ( { model | password = password }, Cmd.none )



{--------------------------------------------------------------------------------
    View
--}


view : Model -> Html Msg
view model =
    Grid.container []
        [ Grid.row [ Row.centerXs ]
            [ Grid.col [ Col.xs12 ]
                [ text "Some content for my view here..." ]
            ]
        , Grid.row [ Row.centerXs ]
            [ Grid.col [ Col.xs4 ]
                [ text "Col 1" ]
            , Grid.col [ Col.xs8 ]
                [ text "Col 2" ]
            ]
        ]



-- div [ class "container" ]
--     [ div [ class "row" ]
--         [ div [ class "col-sm-4" ]
--             [ text "NameX: "
--             ]
--         , div [ class "col-sm-8" ]
--             [ input [ placeholder "Name", onInput Name, value model.name ] []
--             ]
--         ]
--     , div [ class "row" ]
--         [ div [ class "cols-sm-12" ]
--             [ text (String.reverse model.name)
--             ]
--         ]
--     , div []
--         [ p []
--             [ a [ attribute "aria-controls" "collapseExample", attribute "aria-expanded" "false", class "btn btn-primary", attribute "data-toggle" "collapse", href "#collapseExample" ]
--                 [ text "Link with href  " ]
--             , button [ attribute "aria-controls" "collapseExample", attribute "aria-expanded" "false", class "btn btn-primary", attribute "data-target" "#collapseExample", attribute "data-toggle" "collapse", type_ "button" ]
--                 [ text "Button with data-target  " ]
--             ]
--         ]
--     ]


revStyle : ( String, String ) -> Html.Attribute msg
revStyle ( color, bgColor ) =
    style [ ( "color", color ), ( "backgroundColor", bgColor ) ]



{--------------------------------------------------------------------------------
    Helper functions
--}
