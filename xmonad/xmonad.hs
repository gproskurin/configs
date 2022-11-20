import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Fullscreen
import XMonad.Layout.NoBorders
import XMonad.Layout.Tabbed
import XMonad.Util.Run(spawnPipe)
--
--import XMonad.Util.EZConfig(additionalKeys)
--import XMonad.Util.EZConfig(additionalKeysP)
import XMonad.Util.EZConfig
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.SetWMName

import System.IO


-- myTabConfig = defaultTheme
myTabConfig = def
    { activeBorderColor = "#FF0000"
    , activeTextColor = "#FFFFFF"
    , inactiveBorderColor = "#000000"
    , inactiveTextColor = "#000000"
    }

myLayout =
    avoidStruts (
        Tall 1 (3/100) (1/2)
        ||| Mirror (Tall 1 (3/100) (1/2))
        ||| tabbed shrinkText myTabConfig
    )
    ||| noBorders (fullscreenFull Full)

-- myEventHook = mconcat [ docksEventHook, handleEventHook defaultConfig ]
myEventHook = handleEventHook def

main = do
    xmproc <- spawnPipe "xmobar"
    -- xmonad $ defaultConfig
    xmonad $ def
        { startupHook = setWMName "LG3D"
        , modMask = mod4Mask
        , borderWidth = 2
        , terminal = "urxvt"
        -- , manageHook = manageDocks <+> manageHook defaultConfig
        , manageHook = manageDocks <+> manageHook def
        -- , layoutHook = avoidStruts  $  layoutHook defaultConfig
        , layoutHook = myLayout
	, handleEventHook = myEventHook
        , logHook = dynamicLogWithPP xmobarPP
            { ppOutput = hPutStrLn xmproc
            , ppTitle = xmobarColor "green" "" . shorten 50
            }
        } `additionalKeysP`
        [ ("M-x f", spawn "firefox")
        -- , ("M-x g", spawn "google-chrome-stable")
        , ("M-x a", spawn "atom")
        , ("M-x c", spawn "code")
        ]

--

