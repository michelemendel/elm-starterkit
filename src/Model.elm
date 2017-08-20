module Model exposing (Model, model)

-- MODEL


type alias Model =
    { name : String
    , password : String
    , passwordAgain : String
    }


model : Model
model =
    { name = "John DDD"
    , password = ""
    , passwordAgain = ""
    }
