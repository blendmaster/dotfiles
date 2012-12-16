import XMonad
import XMonad.Config.Gnome
import XMonad.Util.EZConfig
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.NoBorders

myManageHook = composeAll (
  [ manageHook gnomeConfig
  , className =? "Unity-2d-panel" --> doIgnore
  , className =? "Unity-2d-shell" --> doFloat
  , isFullscreen --> doFullFloat
  ])

myLayoutHook = smartBorders $ layoutHook gnomeConfig

main = xmonad $ gnomeConfig
  { manageHook = myManageHook
  , layoutHook = myLayoutHook
  , modMask = mod4Mask
  }
  `additionalKeys`
  -- why doesn't gnomeConfig define this by default?
  [ ((mod4Mask, xK_p), spawn "exe=`dmenu_run` && eval \"exec $exe\"")
  ]
