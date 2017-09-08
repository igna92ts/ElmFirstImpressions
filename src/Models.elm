module Models exposing (..)

import Routing exposing (Route)

type alias Operator =
    { position : Int
    , name : String
    , box : Int
    }

type alias OperatorForm =
    { formName : String
    , formBox : String
    , validation : ValidationResult
    }

type ValidationResult
    = Error String
    | ValidationOk

type alias Model =
    { operators : List Operator
    , currentOperator : Maybe Operator
    , form : OperatorForm
    , route : Route
    }

initialModel : Route -> Model
initialModel route =
    { operators = [Operator 1 "Nacho" 85, Operator 2 "Nacho2" 84]
    , currentOperator = Nothing
    , form = OperatorForm "" "" ValidationOk
    , route = route
    }