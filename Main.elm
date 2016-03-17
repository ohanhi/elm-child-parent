module Main (..) where

import StartApp
import Effects
import Task
import Parent


app =
  StartApp.start
    { init = Parent.init
    , update = Parent.update
    , view = Parent.view
    , inputs = []
    }


main =
  app.html


port tasks : Signal (Task.Task Effects.Never ())
port tasks =
  app.tasks
