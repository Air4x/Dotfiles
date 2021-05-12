# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

from typing import List  # noqa: F401

import os
import subprocess
from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen, KeyChord
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from libqtile.window import Window

mod = "mod4"
terminal = guess_terminal()

colors = [["#0f111b", "#0f111b"], # background 0
          ["#0f111b", "#2e3459"], # black 1
          ["#e33400", "#e33400"], # red 2
          ["#5ccc96", "#5ccc96"], # green 3
          ["#686f99", "#686f99"], # yellow 4
          ["#009fc5", "#009fc5"], # blue 5
          ["#f2ce00", "#f2ce00"], # magenta 6
          ["#795ccc", "#795ccc"], # cyan 7
          ["#2e3459", "#f0f1ce"], # white 8 
          ["ecf0c1",  "ecf0c1"]]  # foreground 9

Left_Text = '◢'
Right_Text = '◤'

keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(),
        desc="Move window focus to other window"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.shrink_main(),
        desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_main(),
        desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.shrink(),
        desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "f", lazy.window.toggle_floating()),
    # Killing program
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),

    Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    # How to run program
    Key([mod], "r", lazy.spawn("rofi -show run"),
        desc="Spawn rofi as app launcher"),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),

    KeyChord([mod], "e", [
        Key([], "c", lazy.spawn("chromium"), lazy.ungrab_chord()),
        Key([], "b", lazy.spawn("firefox")),
        Key([], "f", lazy.spawn("termite --class=float -e ranger"))],
        mode="programmi"),
    # Multimedia and multifunction keys
    Key([], "XF86AudioMute", lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle")),
    Key([],"XF86AudioRaiseVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +5%")),
    Key([],"XF86AudioLowerVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%")),
    Key([], "XF86MonBrightnessUp", lazy.spawn("IncreaseLuce.sh"), desc="Raise the brightness of the scree"),
    Key([], "XF86MonBrightnessDown", lazy.spawn("LowerLuce.sh"), desc="Descrease the brightness of the screen"),

]

groups = [
    Group("1", label="web"),
    Group("2", label="code", ),
    Group("3", label="mail"),
    Group("4", label="media"),
    Group("5", label="chat"),
]

for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name)),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(i.name)),
        # Or, use below if you prefer not to switch to that group.
        # # mod1 + shift + letter of group = move focused window to group
        # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
        #     desc="move focused window to group {}".format(i.name)),
    ])

layouts = [
    # layout.Columns(border_focus_stack=colors[5]),
    # layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]



widget_defaults = dict(
    font='FiraCode Nerd Font Mono',
    fontsize=12,
    padding=2,
    background = colors[0]
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        bottom=bar.Bar(
            [
                widget.CurrentLayout(foreground=colors[9]),
                #----GroupBox----#
                widget.TextBox(text=Left_Text, foreground=colors[4], fontsize=55, padding=-2),
                widget.GroupBox(background=colors[4], hide_unused= False),
                widget.TextBox(text=Right_Text, foreground=colors[4], fontsize=55, padding=-2),
                widget.Chord(foreground=colors[4], fmt='--{}--'),
                #----WindowName----#
                widget.WindowName(foreground=colors[9]),
                #----Mpd----#
                widget.Mpd2(foreground=colors[9]),
                #----Volume----#
                widget.TextBox(text=Left_Text, foreground=colors[3],background=colors[0], fontsize=55, padding=-2),
                widget.Volume(foreground=colors[9],cardid= '0', background=colors[3], padding=1),
                widget.TextBox(text=Right_Text, foreground=colors[3], padding=-2, fontsize=55),
                #----Battery----#
                widget.TextBox(text=Left_Text, foreground=colors[5], fontsize=55, padding=-2),
                widget.Battery(foreground=colors[9], background=colors[5]),
                widget.TextBox(text=Right_Text, foreground=colors[5], padding=-2, fontsize=55),
                #----Clock----# 
                widget.TextBox(text=Left_Text,foreground=colors[7], fontsize=55, padding=-2),
                widget.Clock(format='%Y-%m-%d %a %I:%M %p',foreground=colors[9], background=colors[7]),
                widget.TextBox(text=Right_Text, foreground=colors[7], padding=-2, fontsize=55),
                #----Systray----#
                widget.Systray(),
                widget.QuickExit(foreground=colors[9]),
            ],
            24,
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod, "shift"], "Button3", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
    Match(wm_class='float')
])
auto_fullscreen = True
focus_on_window_activation = "smart"

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call([home])

autostart()

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
