import XMonad hiding (Tall)
import XMonad.Layout.HintedTile
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run
import XMonad.Layout.StackTile
import System.IO

myWorkspaces = ["1","2","3","4","5"]

myManageHook = composeAll
  [ className =? "feh" --> doFloat
  , manageDocks
  ]

main = do
  xmproc <- spawnPipe "/usr/bin/xmobar /home/eric/.xmobarrc" 
  xmonad $ defaultConfig
    { manageHook = myManageHook <+> manageHook defaultConfig
    , layoutHook = myLayout 
    , terminal = "urxvtc"
    , logHook = dynamicLogWithPP $ xmobarPP
      { ppOutput = hPutStrLn xmproc
      , ppTitle = xmobarColor "white" "" . shorten 75 
      , ppHiddenNoWindows = xmobarColor "white" "" --Unused desktops
      , ppCurrent = xmobarColor "green" "" --Current desktop
      , ppHidden = xmobarColor "red" "" --Used desktops not currently in use
      , ppLayout = xmobarColor "white" ""
      , ppSep = " <fc=white>:</fc> "
      } 
    , modMask = mod4Mask
    , borderWidth = 2
    , focusedBorderColor = "#00FF33"
    , normalBorderColor = "#9900DD" 
    , workspaces = myWorkspaces
    }

myLayout = avoidStruts $ tiled ||| wideTiled ||| Full
  where
    tiled = HintedTile nmaster delta ratio Center Tall
    wideTiled = HintedTile nmaster delta ratio Center Wide
    nmaster = 1
    ratio = 1/2
    delta = 3/100
