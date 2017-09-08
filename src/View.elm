module View exposing (view)


import Html exposing (..)
import Html.Attributes exposing (class, href, src, style)
import Models exposing (Model)
import Msgs exposing (Msg)
import Routing exposing (Route(..))

import Operators.List exposing (operatorList)
import Operators.Register exposing (registrationForm)

view : Model -> Html Msg
view model =
    navBar (div [class "container"]
        [case model.route of
            OperatorsRoute ->
                operatorList model.operators
            RegisterRoute ->
                registrationForm
            NotFoundRounte ->
                text "404 NOT FOUND"
        ])


navBar : Html Msg -> Html Msg
navBar page =
    div []
        [nav [style [("background-color", "white"),("height", "100px")]]
            [ div [ class "nav-wrapper"]
                [ a [ class "brand-logo", href "#" ]
                    [ img [ src "http://www.redargentinait.com/imagenes/institucionales/2015-02/353-wolox.png" ][]
                    ]
                ]
            ]
        , page
        ]