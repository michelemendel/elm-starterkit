module Main exposing (..)

import Debug exposing (log)
import Html exposing (Html, div, text, input, p, h4, a, button)
import Html.Attributes exposing (style, class, placeholder, value, href, attribute, type_)
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
    div [ class "container" ]
        [ div [ class "row" ]
            [ div [ class "col-sm-4" ]
                [ (text "Name: ")
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
                [ a [ attribute "aria-controls" "collapseExample", attribute "aria-expanded" "false", class "btn btn-primary", attribute "data-toggle" "collapse", href "#collapseExample" ]
                    [ text "Link with href  " ]
                , button [ attribute "aria-controls" "collapseExample", attribute "aria-expanded" "false", class "btn btn-primary", attribute "data-target" "#collapseExample", attribute "data-toggle" "collapse", type_ "button" ]
                    [ text "Button with data-target  " ]
                ]
            ]
        ]


revStyle : ( String, String ) -> Html.Attribute msg
revStyle ( color, bgColor ) =
    style [ ( "color", color ), ( "backgroundColor", bgColor ) ]
