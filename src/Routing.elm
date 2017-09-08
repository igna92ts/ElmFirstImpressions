module Routing exposing (..)

import Navigation exposing (Location)
import UrlParser exposing (..)

type Route
    = OperatorsRoute
    | RegisterRoute
    | NotFoundRounte

matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map OperatorsRoute top
        , map RegisterRoute (s "register")
        , map OperatorsRoute (s "list")
        ]

parseLocation : Location -> Route
parseLocation location =
    case (parseHash matchers location) of
        Just route ->
            route
        Nothing ->
            NotFoundRounte