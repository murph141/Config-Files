-- Imports
import XMonad hiding (Tall)
import XMonad.Layout.HintedTile
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run
import XMonad.Layout.StackTile
import System.IO

myWorkspaces = ["1","2","3","4","5"] -- Set 5 workspaces

-- Tell feh to float and manage all docs (xmobar)
myManageHook = composeAll
  [ className =? "feh" --> doFloat
  , manageDocks
  ]

-- Main configurations
main = do
  -- Spawn xmobar with its configuration file
  xmproc <- spawnPipe "/usr/bin/xmobar ~/.xmobarrc" 

  -- Call xmonad with the default configuration
  xmonad $ defaultConfig
    { manageHook = myManageHook <+> manageHook defaultConfig -- Manage hooks
    , layoutHook = myLayout -- Set the layout to my defined layout (see below)
    , terminal = "urxvtc" -- Set the terminal to the urxvt client
    , logHook = dynamicLogWithPP $ xmobarPP -- Use xmonad's dynamic logger
      -- Logger options
      { ppOutput = hPutStrLn xmproc
      , ppTitle = xmobarColor "white" "" . shorten 75 -- Set the color to white and limit the length to 75 characters
      , ppHiddenNoWindows = xmobarColor "white" "" --Unused workspaces
      , ppCurrent = xmobarColor "green" "" -- Current workspace
      , ppHidden = xmobarColor "red" "" -- Used workspaces not currently in use
      , ppLayout = xmobarColor "white" "" -- Unsed workspaces
      , ppSep = " <fc=white>:</fc> " -- Set the field seperator to " : " with the colon being white
      } 
    , modMask = mod4Mask -- Set the mod key to Mod4 (Usually the Windows key)
    , borderWidth = 2 -- Set the border width to 2
    , focusedBorderColor = "#00FF33" -- Focused border is green
    , normalBorderColor = "#9900DD" -- Non-focused border(s) are purple
    , workspaces = myWorkspaces -- Set 5 workspaces, defined above
    }

myLayout = avoidStruts $ tiled ||| wideTiled ||| Full
  where
    tiled = HintedTile nmaster delta ratio Center Tall -- Use the defined values and imported values in the tiled scheme
    wideTiled = HintedTile nmaster delta ratio Center Wide -- Use the defined values and imported values in the wideTiled scheme
    nmaster = 1 -- Master size
    ratio = 1/2 -- Ratio used between windows by default
    delta = 3/100 -- The separation between windows
