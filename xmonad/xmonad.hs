import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Fullscreen
import XMonad.Layout.NoBorders
import XMonad.Layout.Tabbed
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.EZConfig(additionalKeysP)
import System.IO

myTabConfig = defaultTheme
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

myEventHook = mconcat [ docksEventHook, handleEventHook defaultConfig ]

main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ defaultConfig
        { modMask = mod4Mask
        , borderWidth = 2
        , terminal = "urxvt"
        , manageHook = manageDocks <+> manageHook defaultConfig
        --, layoutHook = avoidStruts  $  layoutHook defaultConfig
        , layoutHook = myLayout
	, handleEventHook = myEventHook
        , logHook = dynamicLogWithPP xmobarPP
            { ppOutput = hPutStrLn xmproc
            , ppTitle = xmobarColor "green" "" . shorten 50
            }
        } `additionalKeysP`
        [ ("M-x f", spawn "firefox")
        ]

--
