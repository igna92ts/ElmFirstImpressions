module Main exposing (..)

import View exposing (view)
import Update exposing (update)
import Models exposing (Model, initialModel)
import Msgs exposing (Msg(..))
import Routing exposing (parseLocation)
import Navigation exposing (Location)

subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none

init : Location -> (Model, Cmd Msg)
init location =
    let
        currentRoute =
            parseLocation location
    in
        (initialModel currentRoute, Cmd.none)

main : Program Never Model Msg
main =
    Navigation.program OnLocationChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
