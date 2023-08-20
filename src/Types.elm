module Types exposing (..)

import BigInt exposing (BigInt)
import Http


type Msg
    = NoOp
    | ResultFetched (Result Http.Error BigInt)


type alias Flags =
    ()


type alias Model =
    { numSold : Maybe BigInt
    }
