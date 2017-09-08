module Msgs exposing (..)

import Navigation exposing (Location)
import Http
import Models exposing (Operator)

type Msg
    = OnLocationChange Location
    | FormMsg FormMsg
    | OperatorRegistered (Result Http.Error Operator)

type FormMsg
    = ChangeName String
    | ChangeBox String
    | Submit