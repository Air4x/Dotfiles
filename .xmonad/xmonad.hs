-- Base
import XMonad
import System.Exit
import qualified XMonad.StackSet as W
import Graphics.X11.ExtraTypes.XF86

-- Data Structures
import qualified Data.Map as M
import Data.Monoid

-- Utils
import XMonad.Util.Run
import XMonad.Util.SpawnOnce

-- Hooks
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageHelpers

-- Actions
import XMonad.Actions.CopyWindow

-- Layouts
import XMonad.Layout.ThreeColumns
import XMonad.Layout.Spacing

-- Names and options
--- Default terminal
myTerminal      = "alacritty"

myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

-- Whether clicking on a window to focus also passes the click to the window
myClickJustFocuses :: Bool
myClickJustFocuses = False

-- Width of the window border in pixels.
myBorderWidth   = 2

-- Mod key (windows key or super key)
myModMask       = mod4Mask

-- Workspaces
myWorkspaces    = ["Lavoro","Web","Chat","Editor","Varie0","Varie1"]

-- Border colors for unfocused and focused windows, respectively.
myNormalBorderColor  = "#dddddd"
myFocusedBorderColor = "#ff0000" 

------------------------------------------------------------------------
-- Key bindings
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $

    ------------------------------------------------------------------------
    -- Programs
    --- launch a terminal
    [ ((modm,               xK_Return), spawn $ XMonad.terminal conf)
    --- launch rofi as drun 
    , ((modm,               xK_space ), spawn "rofi -modi drun -show drun -icon-themes 'Papirus' -show-icons" )
    --- A little script to see video in mpv
    , ((modm,                   xK_y ), spawn "~/.Scripts/mpv-clipboard.sh")
    --- A little script to see some info about volume, mpd, and backlight
    , ((modm,                   xK_i ), spawn "info.sh")
    --- Emacsclient
    , ((modm .|. controlMask,	xK_e ), spawn "emacsclient -c")
    --- Firefox
    , ((modm .|. controlMask,   xK_w ), spawn "firefox")
    -----------------------------------------------------------------------

    -----------------------------------------------------------------------
    -- MultiMedia  controls
    --- Volume Up
    , ((0, xF86XK_AudioRaiseVolume), spawn "IncreaseVolume.sh" )
    --- Volume Down
    , ((0, xF86XK_AudioLowerVolume), spawn "LowerVolume.sh" )
    --- Volume Mute Toggle
    , ((0, xF86XK_AudioMute), spawn "ToggleVolume.sh")
    --- Monitor Brightness Up
    , ((0, xF86XK_MonBrightnessUp), spawn "IncreaseLuce.sh")
    --- Monitor Brightness Down
    , ((0, xF86XK_MonBrightnessDown), spawn "LowerLuce.sh")
    ---------------------------------------------------------------------

    ---------------------------------------------------------------------
    -- Window's controls
    --- close focused window
    , ((modm, xK_c                  ), kill)
    --- Copy the focused window on all workspaces
    , ((modm,               xK_v    ), windows copyToAll)
    --- Resize viewed windows to the correct size
    , ((modm,               xK_n    ), refresh)
    --- Move focus to the next window
    , ((modm,               xK_Tab   ), windows W.focusDown)
    --- Move focus to the next window
    , ((modm,               xK_j     ), windows W.focusDown)
    --- Move focus to the previous window
    , ((modm,               xK_k     ), windows W.focusUp  )
    --- Move focus to the master window
    , ((modm,               xK_m     ), windows W.focusMaster  )
    --- Swap the focused window and the master window
    , ((modm .|. shiftMask,  xK_Return), windows W.swapMaster)
    --- Swap the focused window with the next window
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )
    --- Swap the focused window with the previous window
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )
    --- Push window back into tiling
    , ((modm,               xK_t     ), withFocused $ windows . W.sink)
    ---------------------------------------------------------------------

    ---------------------------------------------------------------------
    -- Layout controls
    --- Reset the layouts on the current workspace to default
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)
    --- Rotate through the available layout algorithms
    , ((modm,               xK_p    ), sendMessage NextLayout)
    --- Shrink the master area
    , ((modm,               xK_h     ), sendMessage Shrink)
    --- Expand the master area
    , ((modm,               xK_l     ), sendMessage Expand)
    --- Increment the number of windows in the master area
    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))
    --- Deincrement the number of windows in the master area
    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))
    ---------------------------------------------------------------------

    ---------------------------------------------------------------------
    -- Toggle the status bar gap
    , ((modm              , xK_b     ), sendMessage ToggleStruts)
    ---------------------------------------------------------------------

    ---------------------------------------------------------------------
    -- Xmonad controls (quit and restart)
    -- Quit
    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))
    -- Restart
    , ((modm              , xK_q     ), spawn "xmonad --recompile; xmonad --restart")
    ]
    ---------------------------------------------------------------------
    ++
    -----------------------------------------------------------
    -- Workspaces controls
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    -----------------------------------------------------------
    ++
    -----------------------------------------------------------
    -- Physical screens controls
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]
    -----------------------------------------------------------


------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $

    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))

    -- mod-button2, Raise the window to the top of the stack
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))

    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))

    -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]

------------------------------------------------------------------------
-- Layouts:
myLayout = avoidStruts (spacing 8 $tiled ||| ThreeColMid 1 (3/100) (1/2) ||| Mirror tiled ||| Full)
  where
     -- Master-Slave
     tiled   = Tall nmaster delta ratio
     -- Number of Master clients by default
     nmaster = 1
     -- Default proportion of screen occupied by master pane
     ratio   = 1/2
     -- Percent of screen to increment by when resizing panes
     delta   = 3/100

------------------------------------------------------------------------
-- Window rules:
myManageHook = composeAll [ 
    className =? "Gimp-2.10"        --> doFloat
    , className =? "Gimp-2.10"      --> doShift "Editor"
    , resource  =? "desktop_window" --> doIgnore
    , resource  =? "kdesktop"       --> doIgnore 
    , className =? "mpv"            --> doFloat
    , className =? "firefox"        --> doShift "Web"
    , className =? "Zenity"         --> doFloat
    , className =? "Ankama Launcher" --> doShift "Lavoro"
    , className =? "com-ankamagames-wakfu-client-WakfuClient" --> doShift "Lavoro"
    , className =? "FLTK"           --> doFloat
    ]

------------------------------------------------------------------------
-- Event handling

-- * EwmhDesktops users should change this to ewmhDesktopsEventHook
--
-- Defines a custom handler function for X Events. The function should
-- return (All True) if the default handler is to be run afterwards. To
-- combine event hooks use mappend or mconcat from Data.Monoid.
--
myEventHook = ewmhDesktopsEventHook
------------------------------------------------------------------------

------------------------------------------------------------------------
-- Startup hook

-- Perform an arbitrary action each time xmonad starts or is restarted
-- with mod-q.  Used by, e.g., XMonad.Layout.PerWorkspace to initialize
-- per-workspace layout choices.
--
-- By default, do nothing.
myStartupHook =do
            spawnOnce "fixscreen.sh"
            spawnOnce "xsetroot -cursor_name left_ptr"
            spawnOnce "nm-applet &"
            spawnOnce "picom --experimental-backends &"
            spawnOnce "dunst &"
	    spawnOnce "wallpaper-set.sh"
            spawnOnce "blueman-applet"
            spawnOnce "polybar main"
------------------------------------------------------------------------

------------------------------------------------------------------------
-- The real WM
main = do
    i <- spawnPipe "xmobar -x 0 ~/.xmonad/xmobarrc0"
    h <- spawnPipe "xmobar -x 1 ~/.xmonad/xmobarrc0"
    xmonad (ewmh (docks def{
      -- simple stuff
        terminal           = myTerminal,
        focusFollowsMouse  = myFocusFollowsMouse,
        clickJustFocuses   = myClickJustFocuses,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,

      -- key bindings
        keys               = myKeys,
        mouseBindings      = myMouseBindings,

      -- hooks, layouts
        layoutHook         = myLayout,
        manageHook         = myManageHook,
        handleEventHook    = myEventHook,
        logHook            = dynamicLogWithPP $ xmobarPP 
                                { ppOutput = \x -> hPutStrLn i x
                                                >> hPutStrLn h x
                                , ppHidden = id         
                                , ppVisible = wrap "(" ")"
                                , ppHiddenNoWindows = xmobarColor "#606060" ""
                                , ppSep = " | "
                                , ppOrder = \(ws:l:t:ex) -> [ws,l, t]
                                },
        startupHook        = myStartupHook
    }))

