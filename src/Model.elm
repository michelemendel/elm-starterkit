module Model exposing (Model, initialModel)

-- MODEL


type alias Model =
    { name : String
    , password : String
    , passwordAgain : String
    }


initialModel : Model
initialModel =
    { name = "John DDD"
    , password = ""
    , passwordAgain = ""
    }
