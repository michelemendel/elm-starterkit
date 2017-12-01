module Model exposing (Model, initialModel)

-- MODEL


type alias Model =
    { field : String
    , items : List String
    }


initialModel : Model
initialModel =
    { field = ""
    , items = []
    }
