module Main exposing (..)

-- import Html exposing (Html, a, button, div, h4, input, p, text, img, nav)

import Html.Attributes exposing (attribute, class, placeholder, style, type_, value, src)
import Html.Events exposing (onInput)
import Model exposing (Model, initialModel)
import Platform.Cmd
import String
import Css exposing (..)
import Html
import Html.Styled exposing (toUnstyled, Html, div, text, a, button, p, input)
import Html.Styled.Attributes exposing (css, href, src, styled)
import Html.Styled.Events exposing (onClick)


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
        , view = view >> toUnstyled
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


view : Model -> Html.Html Msg
view model =
    div [ class "container" ]
        [ div
            []
            [ text "Hello from A" ]
        , div
            [ class "row" ]
            [ div [ class "col-sm-4" ]
                [ text "Name: "
                ]
            , div [ class "col-sm-8" ]
                [ input [ placeholder "Name", onInput Name, value model.name ] []
                ]
            ]
        , div [ class "row" ]
            [ div [ class "cols-sm-12" ]
                [ text (String.reverse model.name)
                ]
            ]
        , div []
            [ p []
                [ a [ class "btn btn-primary", attribute "data-toggle" "collapse", href "#collapseExample" ]
                    [ text "Link with href  " ]
                , button [ attribute "aria-controls" "collapseExample", attribute "aria-expanded" "false", class "btn btn-primary", attribute "data-target" "#collapseExample", attribute "data-toggle" "collapse", type_ "button" ]
                    [ text "Button with data-target  " ]
                ]
            ]
        ]


revStyle : ( String, String ) -> Html.Attribute msg
revStyle ( color, bgColor ) =
    style [ ( "color", color ), ( "backgroundColor", bgColor ) ]



{--------------------------------------------------------------------------------
    Helper functions
--}
