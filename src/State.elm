module State exposing (..)

import BigInt
import Contracts.GetNFTSupply as NFTS
import Eth
import Eth.Utils
import Task
import Types exposing (..)


init : Flags -> ( Model, Cmd Msg )
init _ =
    ( { numSold = Nothing
      }
    , Eth.call
        "https://mainnet.infura.io/v3/631c4ac9a91b47688e9fc414bf4f5534"
        (NFTS.currentSupply <|
            Eth.Utils.unsafeToAddress "0xC90AE4500D8b90fcD60ba08425e36Db267eb9773"
        )
        |> Task.attempt ResultFetched
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        ResultFetched result ->
            case result of
                Ok num ->
                    ( { numSold =
                            Just <|
                                BigInt.sub num (BigInt.fromInt 11)
                      }
                    , Cmd.none
                    )

                Err _ ->
                    ( model
                    , Cmd.none
                    )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none
