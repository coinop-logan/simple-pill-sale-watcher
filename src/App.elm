module App exposing (..)

import Browser
import Html exposing (Html)
import State
import Types exposing (..)
import View


main : Program Flags Model Msg
main =
    Browser.element
        { init = State.init
        , view = View.root
        , update = State.update
        , subscriptions = State.subscriptions
        }
