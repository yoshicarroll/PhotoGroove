module PhotoGroove exposing (main)

import Browser
import Html exposing (div, h1, img, node, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)


styles =
    """
body { background-color: rgb(44, 44, 44); color: white; }
img { border: 1px solid white; margin: 5px; }
.large { width: 500px; float: right; }
.selected { margin: 0; border: 6px solid #60b5cc; }
.content { margin: 40px auto; width: 960px; }
#thumbnails { width: 440px; float: left; }
h1 { font-family: Verdana; color: #60b5cc; }
"""


stylesNode =
    node "style" [] [ text styles ]


urlPrefix =
    "http://elm-in-action.com/"


viewThumbnail selectedUrl thumb =
    let
        url =
            thumb.url
    in
    img
        [ src (urlPrefix ++ url)
        , classList [ ( "selected", selectedUrl == url ) ]
        , onClick { description = "ClickedPhoto", data = url }
        ]
        []


view model =
    let
        selectedUrl =
            model.selectedUrl

        photos =
            model.photos

        thumb =
            viewThumbnail selectedUrl
    in
    div [ class "content" ]
        [ stylesNode
        , h1 [] [ text "Photo Groove!" ]
        , div [ id "thumbnails" ]
            (List.map thumb photos)
        , img [ class "large", src (urlPrefix ++ "large/" ++ selectedUrl) ] []
        ]


initialModel =
    { photos =
        [ { url = "1.jpeg" }
        , { url = "2.jpeg" }
        , { url = "3.jpeg" }
        ]
    , selectedUrl = "2.jpeg"
    }


update msg model =
    if msg.description == "ClickedPhoto" then
        { model | selectedUrl = msg.data }

    else
        model


main =
    Browser.sandbox
        { init = initialModel
        , view = view
        , update = update
        }
