import os
import subprocess
from typing import List

from libqtile.config import Click, Drag, EzKey, Group, Key, Screen
from libqtile.command import lazy
from libqtile import bar, extension, hook, layout, widget


def executable(p):
    return os.path.isfile(p) and os.access(p, os.X_OK)


def which(command):
    filepath, filename = os.path.split(command)
    if filepath and executable(command):
        return command

    userpath = os.environ["PATH"].split(os.pathsep)
    paths = (executable(os.path.join(path, command)) for path in userpath)
    for path in paths:
        if path:
            return path
    return None


def sensible_terminal(choices):
    for term in choices:
        if which(term):
            return term


mod = "mod4"
screenshot_dir = "~/Pictures/Screenshots"
terminal_choices = [
    "terminology",
    "gnome_terminal",
    "st",
    "urxvt",
    "xterm",
]

terminal = sensible_terminal(terminal_choices)

backlight_dirs = os.listdir("/sys/class/backlight")
backlight_dir = backlight_dirs[0] if backlight_dirs else "acpi_video0"


# Requirements...
# qutebrowser, flameshot, rofi, light, pavucontrol
class Cmds:
    terminal = terminal
    tmux = "{} -e tmux".format(terminal)
    browser = "qutebrowser"
    full_browser = "firefox --ProfileManager"
    rofi_run = 'rofi -show run -display-run "run > "'
    rofi_window = 'rofi -show window -display-window "window > "'
    screenshot_full = "flameshot full --path {}".format(screenshot_dir)
    screenshot_screen = "flameshot screen --path {}".format(screenshot_dir)
    screenshot_selection = "flameshot gui"
    brightness_up = "light -A 5"
    brightness_down = "light -U 5"
    brightness_max = "light -S 100"
    volume_up = "pactl set-sink-volume @DEFAULT_SINK@ +5%"
    volume_down = "pactl set-sink-volume @DEFAULT_SINK@ -5%"
    volume_toggle = "pactl set-sink-mute @DEFAULT_SINK@ toggle"
    mic_toggle = "amixer -q set Dmic0 toggle"
    refresh = "xrefresh -black"
    lock = "~/.config/qtile/bin/lock"
    reboot = "systemctl reboot"
    halt = "systemctl poweroff"
    logout = "qtile-cmd -o cmd -f shutdown"
    reload = "qtile-cmd -o cmd-f restart"

    def get_kernel(self):
        return check_output(["uname", "-r"])

    def get_uptime(self):
        return check_output(["uptime", "-p"])

    def reload_screen(self):
        subprocess.call(['xrefresh', '-black'])

    def startup(self):
        subprocess.call(['/usr/bin/xset', 'b', 'off'])
        subprocess.call(['/usr/bin/xset', 'r', 'rate', '200', '30'])
        subprocess.call(['/usr/bin/setxkbmap', '-option', 'caps:none'])
        subprocess.call(['killall', 'screensaver'])
        subprocess.call(['killall', 'nm-applet'])
        subprocess.Popen(['/usr/bin/xscreensaver', '-no-capture-stderr', '-no-splash'], stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
        subprocess.Popen(['/usr/bin/nm-applet'], stdout=subprocess.PIPE, stderr=subprocess.STDOUT)


cmds = Cmds()

modifier_keys = {
    "M": mod,
    "A": "mod1",
    "S": "shift",
    "C": "control",
}

keys = [
    EzKey("M-C-r", lazy.restart()),
    EzKey("M-C-S-q", lazy.shutdown()),
    EzKey("M-C-A-q", lazy.shutdown()),
    EzKey("M-<Return>", lazy.spawn(Cmds.terminal)),
    EzKey("M-A-<Return>", lazy.spawn(Cmds.tmux)),
    EzKey("M-S-r", lazy.spawncmd()),
    EzKey("M-b", lazy.spawn(Cmds.browser)),
    EzKey("M-S-b", lazy.spawn(Cmds.full_browser)),

    EzKey("M-h", lazy.layout.left()),
    EzKey("M-j", lazy.layout.up()),
    EzKey("M-k", lazy.layout.down()),
    EzKey("M-l", lazy.layout.right()),

    EzKey("M-S-h", lazy.layout.shuffle_left()),
    EzKey("M-S-j", lazy.layout.shuffle_up()),
    EzKey("M-S-k", lazy.layout.shuffle_down()),
    EzKey("M-S-l", lazy.layout.shuffle_right()),

    EzKey("M-C-h", lazy.layout.grow_left()),
    EzKey("M-C-j", lazy.layout.grow_up()),
    EzKey("M-C-k", lazy.layout.grow_down()),
    EzKey("M-C-l", lazy.layout.grow_right()),

    EzKey("M-A-h", lazy.layout.flip_left()),
    EzKey("M-A-j", lazy.layout.flip_up()),
    EzKey("M-A-k", lazy.layout.flip_down()),
    EzKey("M-A-l", lazy.layout.flip_right()),

    EzKey("M-S-<space>", lazy.layout.flip()),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    EzKey("M-S-<Return>", lazy.layout.toggle_split()),

    EzKey("M-<space>", lazy.layout.next()),
    EzKey("M-n", lazy.layout.normalize()),
    EzKey("M-<Tab>", lazy.next_layout()),

    EzKey("M-S-w", lazy.window.kill()),
    EzKey("M-C-w", lazy.spawn("xkill")),

    EzKey("M-<comma>", lazy.prev_screen()),
    EzKey("M-<period>", lazy.next_screen()),

    EzKey("M-S-x", lazy.hide_show_bar("top")),
    EzKey("M-C-x", lazy.hide_show_bar("bottom")),

    EzKey("A-S-<space>", lazy.widget["keyboardlayout"].next_keyboard()),

    EzKey("<XF86AudioRaiseVolume>", lazy.spawn(Cmds.volume_up)),
    EzKey("<XF86AudioLowerVolume>", lazy.spawn(Cmds.volume_down)),
    EzKey("<XF86AudioMute>", lazy.spawn(Cmds.volume_toggle)),
    EzKey("<XF86AudioMicMute>", lazy.spawn(Cmds.mic_toggle)),
    EzKey("<XF86MonBrightnessUp>", lazy.spawn(Cmds.brightness_up)),
    EzKey("<XF86MonBrightnessDown>", lazy.spawn(Cmds.brightness_down)),
    EzKey("<Print>", lazy.spawn(Cmds.screenshot_selection)),
    EzKey("S-<Print>", lazy.spawn(Cmds.screenshot_full)),
    EzKey("C-<Print>", lazy.spawn(Cmds.screenshot_screen)),

    EzKey("M-r", lazy.spawn(Cmds.rofi_run)),
    EzKey("M-A-w", lazy.spawn(Cmds.rofi_window)),
    EzKey("M-C-q", lazy.run_extension(
        extension.CommandSet(commands={
            "refresh": Cmds.refresh,
            "reload": Cmds.reload,
            "lock": Cmds.lock,
            "logout": Cmds.logout,
            "reboot": Cmds.reboot,
            "halt": Cmds.halt,
        })
    )),
]

groups = [Group(i) for i in "asdfuiop"]

for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen()),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name)),
    ])


layouts = [
    layout.MonadTall(),
    layout.Max(),
    layout.Tile(shift_windows=True),
    layout.Stack(num_stacks=2),
    layout.TreeTab(
        font="Ubuntu",
        fontsize=10,
        sections=["FIRST", "SECOND"],
        section_fontsize=11,
        bg_color="141414",
        active_bg="90C435",
        active_fg="000000",
        inactive_bg="384323",
        inactive_fg="a0a0a0",
        padding_y=5,
        section_top=10,
        panel_width=320,
    ),
    layout.Floating(),
]

widget_defaults = dict(
    font='sans',
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

top_bar_widgets = [
    widget.CurrentLayout(),
    widget.GroupBox(),
    widget.Prompt(),
    widget.WindowName(),
    widget.CPUGraph(),
    widget.MemoryGraph(),
    widget.Backlight(format="BL: {percent:2.0%}", backlight_name=backlight_dir),
    widget.BatteryIcon(),
    widget.Battery(format="Batt: {percent:2.0%} {char}", notify_below=0.1),
    widget.TextBox("default config", name="default"),
    widget.TextBox("Press <M-r> to spawn", foreground="#d75f5f"),
    widget.Systray(),
    widget.Clock(format='%Y-%m-%d %a %I:%M %p'),
]

screens = [
    Screen(top=bar.Bar(top_bar_widgets, 24)),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    {'wmclass': 'confirm'},
    {'wmclass': 'dialog'},
    {'wmclass': 'download'},
    {'wmclass': 'error'},
    {'wmclass': 'file_progress'},
    {'wmclass': 'notification'},
    {'wmclass': 'splash'},
    {'wmclass': 'toolbar'},
    {'wmclass': 'confirmreset'},  # gitk
    {'wmclass': 'makebranch'},  # gitk
    {'wmclass': 'maketag'},  # gitk
    {'wname': 'branchdialog'},  # gitk
    {'wname': 'pinentry'},  # GPG key password entry
    {'wmclass': 'ssh-askpass'},  # ssh-askpass
])
auto_fullscreen = True
focus_on_window_activation = "smart"


@hook.subscribe.startup_once
def startup_once():
    cmds.startup()

@hook.subscribe.screen_change
def screen_change(qtile, ev):
    cmds.reload_screen()
    qtile.cmd_restart()


# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
