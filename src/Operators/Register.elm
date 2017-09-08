module Operators.Register exposing (..)

import Html exposing (Html, div, button, text, input, h1, label, form)
import Html.Events exposing (onClick, onInput)
import Html.Attributes exposing (placeholder, type_, class, id, for, maxlength, style)
import Msgs exposing (Msg(..), FormMsg(..))

registrationForm : Html Msg
registrationForm =
    div [class "row", style [("transform", "translateY(60%)")]]
        [ div [class "col s6 offset-s3"]
              [ form []
                     [ div [class "row"]
                          [ operatorInput
                          , boxInput
                          ]
                     , button [ type_ "button"
                              , class "btn waves-effect waves-light btn-large red darken-1 right"
                              , onClick (FormMsg Submit)][ text "Queue up!"]
                     ]
              ]
        ]


operatorInput : Html Msg
operatorInput =
        div [ class "input-field col s10"]
            [ input [style [("font-size","22px")]
                    , type_ "text"
                    , class "validate"
                    , id "operator_name"
                    , onInput (FormMsg << ChangeName)][]
            , label [for "operator_name"][text "Name"]
            ]


boxInput : Html Msg
boxInput =
        div [ class "input-field col s2"]
            [ input [style [("font-size","20px")]
                    , type_ "text"
                    , class "validate"
                    , id "box_number"
                    , maxlength 4
                    , onInput (FormMsg << ChangeBox)][]
            , label [for "box_number"][text "Box"]
            ]
