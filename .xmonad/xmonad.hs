import XMonad

import System.IO

import XMonad.Util.Run --spawnpipe

import qualified Data.Map as M --keybindings

import XMonad.Util.Run

import XMonad.Hooks.ManageDocks

import XMonad.Layout.ThreeColumns
import XMonad.Layout.NoBorders
import XMonad.Layout.ResizableTile
import XMonad.Layout.Tabbed
import XMonad.Layout.Grid
import qualified XMonad.Layout.Magnifier as Mag
import XMonad.Layout.Renamed --rename layouts

import XMonad.Layout.Gaps --gap for conky and dzen, need to replace with struts at some point
import XMonad.Hooks.DynamicLog --for dzen status bar

--Statusbar
myXmonadBar = "dzen2 -y '1128' -h '24' -w '1808' -ta 'l' -fg '#87AFD7' -bg '#000000' -fn -*-terminus-medium-*-*-*-12-*-*-*-*-*-*-*"

--Terminal
myTerm = "urxvt"

--Border Colors
colorNormalBorder = "#222222"
colorFocusedBorder = "#8c595a"

--Modifier Key
myModMask = mod4Mask

--Status Bar Colors
myLogHook :: Handle -> X ()
myLogHook h = dynamicLogWithPP $ defaultPP
        { ppCurrent           = dzenColor "#429abd" "#000000" .pad .wrap "«" "»"
        , ppHidden            = dzenColor "#CDCDCD" "#000000" .pad .wrap "<" ">"
        , ppHiddenNoWindows   = dzenColor "#222222" "#000000" .pad .wrap "|" "|"
        , ppUrgent            = dzenColor "#ad555a" "#000000" .pad .wrap "¤" "¤"
        , ppSep               = " "
        , ppLayout            = dzenColor "#429abd" "#000000" .pad .wrap "|" "|"
        , ppTitle             = dzenColor "#606060" "#000000" .pad .dzenEscape
        , ppOutput            = hPutStrLn h
        }

--Additional Keyboard Shortcuts
newKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList
    [ ((modm,    xK_p), spawn "dmenu_run -b -fn -*-tamsyn-medium-*-*-*-16-*-*-*-*-*-*-* -nb '#000000' -nf '#FFFFFF'")
        , ((modm,    xK_g), sendMessage $ ToggleGap R)  -- toggle all gaps
        , ((modm,    xK_f), sendMessage $ ToggleGap D)  -- toggle all gaps
        , ((modm,    xK_s), sendMessage MirrorShrink)
        , ((modm,    xK_x), sendMessage MirrorExpand)
        , ((modm,    xK_a), spawn "luakit")
        , ((modm,    xK_z), runInTerm "" "ncmpcpp")
        ]

--Combine New Keys with Old Keys
myKeys x = newKeys x `M.union` keys defaultConfig x

--Layouts, resizableTile allows to resize all windows
myLayout = gaps [(D,24), (R,240)] $ smartBorders $ resizableTile ||| mresizableTile ||| Full ||| tabs ||| magGrid
        where
--                threeColumns = renamed [Replace "Tres"] $ ThreeCol 1 (3/100) (1/3)
                magGrid = renamed [Replace "Grid"] $ Mag.magnifiercz 1.35 $ Grid
                resizableTile = renamed [Replace "Tall"] $ ResizableTall nmaster delta ratio []
                mresizableTile = renamed [Replace "Wide"] $ Mirror resizableTile
                nmaster = 1
                ratio = 1/2
                delta = 3/100
                tabs = renamed [Replace "Tabs"] $ tabbed shrinkText myTabConfig
                myTabConfig = defaultTheme { activeBorderColor = "#9E5641"
                                           , activeTextColor = "#9E5641"
                                           , activeColor = "#000000"
                                           , inactiveBorderColor = "#474747"
                                           , inactiveTextColor = "#474747"
                                           , inactiveColor = "#000000"}

myWorkspaces = [ " 1 " , " 2 " , " 3 " , " 4 " , " 5 " ]

main = do
        dzenLeftBar <- spawnPipe myXmonadBar
        xmonad $ defaultConfig
                { layoutHook = myLayout
                , workspaces = myWorkspaces
                , terminal = myTerm
                , keys = myKeys
                , manageHook = manageDocks <+> manageHook defaultConfig
                , modMask = myModMask
                , logHook = myLogHook dzenLeftBar
                , normalBorderColor = colorNormalBorder
                , focusedBorderColor = colorFocusedBorder
                , borderWidth = 2
                }
