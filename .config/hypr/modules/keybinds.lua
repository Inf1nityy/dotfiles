-- Basics
hl.bind("SUPER + Return", hl.dsp.exec_cmd("ghostty"))
hl.bind("SUPER + SHIFT + Q", hl.dsp.window.close())
hl.bind("SUPER + D", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind("SUPER + T", hl.dsp.exec_cmd("swaync-client -t"))
hl.bind("SUPER + SHIFT + T", hl.dsp.exec_cmd("rofi -show emoji"))
hl.bind("SUPER + SHIFT + C", hl.dsp.exec_cmd("hyprctl reload"))
hl.bind("SUPER + SHIFT + E", hl.dsp.exec_cmd("~/.local/bin/powermenu"))
hl.bind("SUPER + SHIFT + F", hl.dsp.exec_cmd("~/.local/bin/wallpaper-changer"))

-- Layout
hl.bind("SUPER + F", hl.dsp.window.fullscreen())
hl.bind("SUPER + SHIFT + Space", hl.dsp.window.float({ action = "toggle" }))

-- Focus (Vim keys)
hl.bind("SUPER + h", hl.dsp.focus({ direction = "l" }))
hl.bind("SUPER + l", hl.dsp.focus({ direction = "r" }))
hl.bind("SUPER + k", hl.dsp.focus({ direction = "u" }))
hl.bind("SUPER + j", hl.dsp.focus({ direction = "d" }))

-- Focus (Arrow keys)
hl.bind("SUPER + Left", hl.dsp.focus({ direction = "l" }))
hl.bind("SUPER + Right", hl.dsp.focus({ direction = "r" }))
hl.bind("SUPER + Up", hl.dsp.focus({ direction = "u" }))
hl.bind("SUPER + Down", hl.dsp.focus({ direction = "d" }))

-- Move (Vim keys)
hl.bind("SUPER + SHIFT + h", hl.dsp.window.move({ direction = "l" }))
hl.bind("SUPER + SHIFT + l", hl.dsp.window.move({ direction = "r" }))
hl.bind("SUPER + SHIFT + k", hl.dsp.window.move({ direction = "u" }))
hl.bind("SUPER + SHIFT + j", hl.dsp.window.move({ direction = "d" }))

-- Workspaces
for i = 1, 9 do
    local key = tostring(i)
    hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = key }))
    hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = key }))
end
hl.bind("SUPER + 0", hl.dsp.focus({ workspace = "10" }))
hl.bind("SUPER + SHIFT + 0", hl.dsp.window.move({ workspace = "10" }))

-- Scratchpad (Special workspace in Hyprland)
hl.bind("SUPER + SHIFT + minus", hl.dsp.window.move({ workspace = "special" }))
hl.bind("SUPER + minus", hl.dsp.workspace.toggle_special())

-- Resize Mode
hl.bind("SUPER + R", hl.dsp.submap("resize"))

hl.define_submap("resize", function()
    hl.bind("right", hl.dsp.window.resize({ x = 10, y = 0, relative = true}), { repeating = true })
    hl.bind("left", hl.dsp.window.resize({ x = -10, y = 0, relative = true}), { repeating = true })
    hl.bind("up", hl.dsp.window.resize({ x = 0, y = 10, relative = true}), { repeating = true })
    hl.bind("down", hl.dsp.window.resize({ x = 0, y = -10, relative = true}), { repeating = true })

    hl.bind("escape", hl.dsp.submap("reset"))
end)

-- Media Keys (l = locked, e = repeat)
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +5%"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -5%"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("pactl set-source-mute @DEFAULT_SOURCE@ toggle"), { locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"), { locked = true, repeating = true })

-- Screenshots
hl.bind("Print", hl.dsp.exec_cmd("~/.local/bin/screenshot region"))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd("~/.local/bin/screenshot window"))
hl.bind("CTRL + Print", hl.dsp.exec_cmd("~/.local/bin/screenshot all"))

-- Workspace Mouse Scroll
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Window Mouse Drag / Resize
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })
