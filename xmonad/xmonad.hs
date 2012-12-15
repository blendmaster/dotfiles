import XMonad
import XMonad.Config.Gnome
import XMonad.Util.EZConfig

myManageHook = composeAll (
  [ manageHook gnomeConfig
  , className =? "Unity-2d-panel" --> doIgnore
  , className =? "Unity-2d-shell" --> doFloat
  ])

main = xmonad $ gnomeConfig
  { manageHook = myManageHook
  , modMask = mod4Mask
  }
  `additionalKeys`
  -- why doesn't gnomeConfig define this by default?
  [ ((mod4Mask, xK_p), spawn "exe=`dmenu_run` && eval \"exec $exe\"")
  ]
