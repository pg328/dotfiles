import XMonad
import XMonad.Util.EZConfig
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Hooks.EwmhDesktops
import XMonad.StackSet
import XMonad.Layout.Grid
import qualified Data.Map as M

grey1, grey2, grey3, grey4, cyan, orange :: String
black  = "#000000"
grey1  = "#2B2E37"
grey2  = "#555E70"
grey3  = "#697180"
grey4  = "#8691A8"
cyan   = "#8BABF0"
orange = "#C45500"

  -- ("M-S-h", kill),
  -- ("M-S-j", kill),
  -- ("M-S-k", kill),
  -- ("M-S-l", kill),
  -- ("M-t", withFocused $ windows . XMonad.StackSet.float),
  -- ("M-S-t", withFocused $ windows . XMonad.StackSet.sink)
  
main :: IO ()
main = xmonad . ewmhFullscreen . ewmh . xmobarProp $ def
  {
    focusFollowsMouse = False,
    clickJustFocuses = False,
    borderWidth = 1,
    normalBorderColor = grey2,
    focusedBorderColor = black,
    terminal = "terminology",
    modMask = mod4Mask
    }
  `additionalKeysP`
  [
  ("M-f", spawn "firefox" ),
  ("M-s", spawn "steam"),
  ("M-k", windows focusUp),
  ("M-j", windows focusDown),
  ("M-S-k", windows swapUp),
  ("M-S-j", windows swapDown)
  ]

