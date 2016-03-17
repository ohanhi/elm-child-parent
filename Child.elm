module Child (..) where

import Html exposing (..)
import Html.Events exposing (..)
import Effects exposing (Effects)


type alias Model =
  String


type Action
  = None


init : ( Model, Effects Action )
init =
  ( "foobar", Effects.none )


update : a -> b -> ( Model, Effects Action )
update _ _ =
  init


view : (String -> parentAction) -> Signal.Address parentAction -> Model -> Html
view actioner address model =
  button
    [ onClick address (actioner model) ]
    [ text "Set parent's thing" ]
