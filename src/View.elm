module View exposing (..)

import BigInt
import Element exposing (Element)
import Element.Font
import Html exposing (Html)
import Types exposing (..)


root : Model -> Html Msg
root model =
    Element.layout [] <|
        view model


view : Model -> Element Msg
view model =
    Element.column
        [ Element.centerX
        , Element.paddingEach
            { top = 10
            , bottom = 0
            , right = 0
            , left = 0
            }
        ]
        [ headerEl
        , numberReadoutEl model
        ]


headerEl : Element Msg
headerEl =
    Element.el
        [ Element.Font.size 24
        , Element.Font.bold
        ]
    <|
        Element.text "The NUMBER"


numberReadoutEl : Model -> Element Msg
numberReadoutEl model =
    model.numSold
        |> Maybe.map BigInt.toString
        |> Maybe.map Element.text
        |> Maybe.withDefault loadingMsg


loadingMsg : Element Msg
loadingMsg =
    Element.el
        [ Element.Font.color <| Element.rgb 1 0 0 ]
    <|
        Element.text "Loading"
