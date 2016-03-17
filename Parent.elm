module Parent (..) where

import Effects exposing (Effects)
import Html exposing (..)
import Child


type alias Model =
  { child : Child.Model
  , foo : String
  }


type Action
  = NewFoo String
  | ChildAction Child.Action


init : ( Model, Effects Action )
init =
  let
    ( child, fx ) =
      Child.init
  in
    ( Model child ""
    , Effects.map ChildAction fx
    )


update : Action -> Model -> ( Model, Effects Action )
update action model =
  case action of
    NewFoo s ->
      ( { model | foo = s }, Effects.none )

    ChildAction act ->
      let
        ( child, fx ) =
          Child.update act model.child
      in
        ( { model | child = child }, Effects.none )


view : Signal.Address Action -> Model -> Html
view address model =
  div
    []
    [ h1 [] [ text model.foo ]
    , Child.view NewFoo address model.child
    ]
