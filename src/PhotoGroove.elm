module PhotoGroove exposing (main)

import Html exposing (div, h1, img, node, text)
import Html.Attributes exposing (..)


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


view model =
    div [ class "content" ]
        [ stylesNode
        , h1 [] [ text "Photo Groove!" ]
        , div [ id "thumbnials" ]
            (List.map viewThumbnail model)
        ]


viewThumbnail thumb =
    img [ src (urlPrefix ++ thumb.url) ] []


initialModel =
    [ { url = "1.jpeg" }
    , { url = "2.jpeg" }
    , { url = "3.jpeg" }
    ]


main =
    view initialModel
