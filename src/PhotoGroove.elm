module PhotoGroove exposing (main)

import Html exposing (div, h1, img, text)
import Html.Attributes exposing (..)


view model =
    div [ class "content" ] [ h1 [] [ text "Photo Groove!" ] ]


main =
    view "no model yet"
