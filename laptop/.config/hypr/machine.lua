hl.monitor({ output = "eDP-1", mode = "1920x1200@60", position = "auto", scale = 1 })
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1, mirror = "eDP-1" })

hl.config({ input = { sensitivity = 0.5 } })

hl.device({
	name = "wacom-hid-53e9-finger",
	output = "eDP-1",
})

hl.device({
	name = "wacom-hid-53e9-pen",
	output = "eDP-1",
})

hl.dsp.exec_cmd("$HOME/.config/hypr/rotate_screen.sh")
