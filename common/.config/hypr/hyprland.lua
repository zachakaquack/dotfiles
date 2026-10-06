local WAL_COLORS = require("colors")
require("machine")

local SUPER = " SUPER + " -- "windows" key
local CTRL = " CTRL + "
local SHIFT = " SHIFT + "
local ALT = " ALT + "

local terminalStartup = "foot --server"
local tmuxStartup = "tmux new-session -d"

local notificationDaemon = "swaync"
local wallpaperDaemon = "awww-daemon"
local restoreWallpaper = "awww restore"

local terminal = "footclient"
local bar = "waybar"
local menu = "fuzzel"
local fileManager = "thunar"

-- MONITOR
hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = "auto",
})

-- STARTUP
hl.on("hyprland.start", function()
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY HYPRLAND_INSTANCE_SIGNATURE")
	hl.exec_cmd("dbus-launch --exit-with-session")
	hl.exec_cmd("kdeconnectd")
	hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
	hl.exec_cmd("otd-daemon")
	hl.exec_cmd("steam -silent")
	hl.exec_cmd(terminalStartup)
	hl.exec_cmd(tmuxStartup)
	hl.exec_cmd(notificationDaemon)
	hl.exec_cmd(bar)
	hl.exec_cmd(wallpaperDaemon)
	hl.exec_cmd(restoreWallpaper)

	-- launch vesktop and terminal after a slight delay (in the script)
	-- allows for the foot --server to launch and everything to setup.
	hl.exec_cmd("$HOME/.config/hypr/extra_startup.sh &")
end)

-- ENV VARS
hl.env("XCURSOR_SIZE", 24)
hl.env("HYPRCURSOR_SIZE", 24)
hl.env("XDG_MENU_PREFIX", "arch-")

-- CONFIG
-- excluding defaults
hl.config({
	general = {
		gaps_in = 2,
		gaps_out = 0,

		col = {
			-- active_border = WAL_COLORS.colors.color11,
			-- inactive_border = WAL_COLORS.colors.color7,
		},
	},
	decoration = {
		rounding = 0,

		shadow = { enabled = false },

		blur = { size = 5 },
	},
	animations = { enabled = false },
	input = { kb_options = "caps:swapescape" },
})

-- Ref https://wiki.hypr.land/configuring/core/rules/workspace-rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]", gaps_out = 0, gaps_in = 0 })
hl.window_rule({
	name = "no-gaps-wtv1",
	match = { float = false, workspace = "w[tv1]" },
	border_size = 0,
	rounding = 0,
})
hl.window_rule({
	name = "no-gaps-f1",
	match = { float = false, workspace = "f[1]" },
	border_size = 0,
	rounding = 0,
})

-- WINDOW AND WORKSPACE RULES
hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

hl.window_rule({
	name = "vesktorp",
	workspace = "2 silent",
	match = { class = "^(vesktop)$" },
})

-- BINDINGS
-- menus
hl.bind(CTRL .. SHIFT .. "SPACE", hl.dsp.exec_cmd(menu))
hl.bind(SUPER .. "SPACE", hl.dsp.exec_cmd("$SCRIPTS/fzf_scripts/launcher.sh"))

-- restart waybar
hl.bind(SUPER .. "w", hl.dsp.exec_cmd("pkill waybar; waybar"))

-- screenshots
hl.bind(SUPER .. "PRINT", hl.dsp.exec_cmd("hyprshot -m window -o $HOME/Pictures/screenshots/"))
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m output -o $HOME/Pictures/screenshots/"))
hl.bind(SUPER .. SHIFT .. "s", hl.dsp.exec_cmd("hyprshot -m region -o $HOME/Pictures/screenshots/"))

-- apps
hl.bind(SUPER .. SHIFT .. "l", hl.dsp.exec_cmd("librewolf"))
hl.bind(SUPER .. "e", hl.dsp.exec_cmd(fileManager))
hl.bind(SUPER .. SHIFT .. "c", hl.dsp.exec_cmd("hyprpicker -al"))

-- DEFAULT HYPRLAND BINDS
--- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 1%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- stuff
hl.bind(SUPER .. "q", hl.dsp.exec_cmd(terminal))
hl.bind(SUPER .. "c", hl.dsp.window.close())
hl.bind(SUPER .. "v", hl.dsp.window.float({ action = "toggle" }))

hl.unbind(SUPER .. "h")
hl.unbind(SUPER .. "j")
hl.unbind(SUPER .. "k")
hl.unbind(SUPER .. "l")
-- mover
hl.bind(SUPER .. "h", hl.dsp.focus({ direction = "left" }))
hl.bind(SUPER .. "left", hl.dsp.focus({ direction = "left" }))
hl.bind(SUPER .. "j", hl.dsp.focus({ direction = "down" }))
hl.bind(SUPER .. "down", hl.dsp.focus({ direction = "down" }))
hl.bind(SUPER .. "k", hl.dsp.focus({ direction = "up" }))
hl.bind(SUPER .. "up", hl.dsp.focus({ direction = "up" }))
hl.bind(SUPER .. "l", hl.dsp.focus({ direction = "right" }))
hl.bind(SUPER .. "right", hl.dsp.focus({ direction = "right" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(SUPER .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(SUPER .. SHIFT .. key, hl.dsp.window.move({ workspace = i }))
end

-- Move/resize windows with mainMod .. LMB/RMB and dragging
hl.bind(SUPER .. "mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(SUPER .. SHIFT .. "mouse:272", hl.dsp.window.resize(), { mouse = true })
