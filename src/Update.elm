module Update exposing (..)

import Msgs exposing (Msg(..), FormMsg(..))
import Models exposing (Model, OperatorForm, ValidationResult(..))
import Routing exposing (parseLocation)

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        OnLocationChange location ->
            ({ model | route = parseLocation location }, Cmd.none )
        FormMsg formMsg ->
            let
                (newForm, formCmd) =
                    updateForm formMsg model.form
            in
                ({ model | form = newForm}, formCmd )
        OperatorRegistered (Ok newOperator) ->
            ({model | currentOperator = Just newOperator}, Cmd.none)
        OperatorRegistered (Err _) ->
            (model, Cmd.none) -- TODO MANEJAR ESTA MIERDA EN ALGUN MOMENTO


updateForm : FormMsg -> OperatorForm -> (OperatorForm, Cmd Msg)
updateForm formMsg form =
    case formMsg of
        ChangeName newName ->
            ({form | formName = newName}, Cmd.none)
        ChangeBox newBox ->
            ({form | formBox = newBox}, Cmd.none)
        Submit ->
            validateForm form



validateForm : OperatorForm -> (OperatorForm, Cmd Msg)
validateForm form =
  if (String.length form.formName) < 3 then
    ({ form | validation = Error "Name should be at least 3 characters long"}, Cmd.none)
  else if (String.isEmpty form.formBox) then
    ({ form | validation = Error "You must choose a box number"}, Cmd.none)
  else
    ({ form | validation = ValidationOk}, Cmd.none)