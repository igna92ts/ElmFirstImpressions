module Operators.List exposing (..)

import Models exposing (Operator)
import Msgs exposing (Msg)
import Html exposing (..)
import Html.Attributes exposing (style, href, class)

operatorList : List Operator -> Html Msg
operatorList operators =
    div [ style tableFlex ]
        [ table []
            [ thead []
                [ tr []
                    [ th [] [ text "Position" ]
                    , th [] [ text "Name" ]
                    , th [] [ text "Box" ]
                    ]
                ]
            , tbody [] (List.map operatorRow operators)
            ]
        , a [class "btn", href "/#register"] [ text "Join the queue" ]
        ]

operatorRow : Operator -> Html Msg
operatorRow operator =
    tr []
        [ td [] [ text (toString operator.position) ]
        , td [] [ text operator.name ]
        , td [] [ text (toString operator.box) ]
        ]

tableFlex : List (String, String)
tableFlex = 
    [ ("display", "flex")
    , ("flex-direction", "column")
    , ("align-items", "center")
    ]
