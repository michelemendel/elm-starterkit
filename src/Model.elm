module Model exposing (Model, Entry, initialModel)

{--------------------------------------------------------------------------------
    Model
--}


type alias Model =
    { field : String
    , entries : List Entry
    , currentId : Int
    }


type alias Entry =
    { id : Int
    , text : String
    }


initialModel : Model
initialModel =
    { field = ""
    , entries = []
    , currentId = 0
    }
