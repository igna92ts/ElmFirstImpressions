module Commands exposing (..)

import Models exposing (OperatorForm)
import Msgs exposing (Msg(..))
import Http
import Json.Decode as Decode

registerOperator : OperatorForm -> Cmd Msg
registerOperator form =
    let
        url =
            "localhost:4000/register"
        request =
            Http.post form decodeOperator
    in
        Http.send OperatorRegistered request

-- decodeOperator : Decode.Decoder Operator
-- decodeOperator =
