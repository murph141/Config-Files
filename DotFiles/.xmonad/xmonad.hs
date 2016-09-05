import XMonad hiding (Tall)
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout.HintedTile
import XMonad.Layout.NoBorders
import XMonad.Layout.StackTile
import XMonad.Util.Run
import System.IO

-- ******************************** --
-- Borders are currently turned off --
-- ******************************** --

myWorkspaces = ["1","2","3","4","5"] -- Set 5 workspaces

-- Tell feh and mplayer to float and manage all docks (xmobar)
myManageHook = composeAll
  [ className =? "feh" --> doFloat
  , className =? "mplayer" --> doFloat
  , manageDocks
  ]

-- Main configurations
main = do
  -- Spawn xmobar with its configuration file
  xmproc <- spawnPipe "/usr/bin/xmobar ~/.xmobarrc" 

  -- Call xmonad with the default configuration
  xmonad $ defaultConfig
    { manageHook = myManageHook <+> manageHook defaultConfig -- Manage hooks
    , layoutHook = smartBorders $ myLayout  -- Set the layout to my defined layout (see below)
    , terminal = "urxvtc" -- Set the terminal to the urxvt client
    , logHook = dynamicLogWithPP $ xmobarPP -- Use xmonad's dynamic logger
      -- Logger options
      { ppOutput = hPutStrLn xmproc
      , ppTitle = xmobarColor "white" "" . shorten 75 -- Set the color to white and limit the length to 75 characters
      , ppHiddenNoWindows = xmobarColor "white" "" -- Unused workspaces
      , ppCurrent = xmobarColor "green" "" -- Current workspace
      , ppHidden = xmobarColor "red" "" -- Used workspaces not currently in use
      , ppLayout = xmobarColor "white" "" -- Unused workspaces
      , ppSep = " <fc=white>:</fc> " -- Set the field separator to " : " with the colon being white
      } 
    , modMask = mod4Mask -- Set the mod key to Mod4 (Usually the Windows key)
    , borderWidth = 2 -- Set the border width to 2
    , focusedBorderColor = "#000000" -- Focused border color
    , normalBorderColor = "#000000"  -- Non-focused border(s) color
    --, focusedBorderColor = "#00FF33" -- Border color for green
    --, normalBorderColor = "#9900DD" -- Border color for purple
    , workspaces = myWorkspaces -- Set the workspaces equal to my defined workspaces
    }

myLayout = avoidStruts $ tiled ||| wideTiled ||| Full
  where
    tiled = HintedTile nmaster delta ratio Center Tall -- Use the defined values and imported values in the Tiled scheme
    wideTiled = HintedTile nmaster delta ratio Center Wide -- Use the defined values and the imported values in the wideTiled scheme
    nmaster = 1 -- Master size
    ratio = 1/2 -- Ratio used between windows by default
    delta = 3/100 -- The separation between windows
