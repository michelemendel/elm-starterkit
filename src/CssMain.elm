module CssMain exposing (..)

import Css exposing (..)


-- (stylesheet << namespace "homepage")
--   [ body
--       [ padding (px 30)
--       , width (pct 100)
--       ]
--   ]


redBorder : Style
redBorder =
    Css.batch
        [ display inlineBlock
        , padding (px 20)
        , border3 (px 5) solid (rgb 120 120 120)
        ]


{-| A plain old record holding a couple of theme colors.
-}
theme : { secondary : Color, primary : Color }
theme =
    { primary = hex "55af6a"
    , secondary = rgb 250 240 230
    }



-- #elm-app {
--   font: 16px 'Verdana', "Helvetica Neue",Helvetica,Arial,sans-serif;
-- }
-- .row {
--   border: 1px solid blue; }
-- div[class^="col"] {
--   border: 1px solid salmon; }
