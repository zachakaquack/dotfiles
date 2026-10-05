-- left monitor(s)
hl.monitor({ output = "DP-1", mode = "1920x1080@144", position = "0x0", scale = 1 })
-- hl.monitor({ output = "DP-2", mode = "1920x1080@144", position = "0x0", scale = 1 })

-- right monitor
hl.monitor({ output = "HDMI-A-I", mode = "1920x1080@60", position = "1920x0", scale = 1 })

hl.config({ input = { sensitivity = -0.6 } })
