---@module 'hl'
--##################
--## MY PROGRAMS ###
--##################

-- See https://wiki.hyprland.org/Configuring/Keywords/
-- Set programs that you use
local terminal = "kitty"
local fileManager = "nautilus"
local menu = "pkill rofi; rofi -show combi"
local run = "pkill rofi; rofi -show run"
local lock = "~/.config/hypr/scripts/hyprlock"
local logoutMenu = "~/.config/hypr/scripts/logout"
local clipboard = "~/.config/hypr/scripts/clipboard"
local screenshots = "~/.config/hypr/scripts/screenshots"
local kill = "~/.config/hypr/scripts/kill"
local monitorreset = "~/.config/hypr/scripts/monitor-control reset"
local emoji = "bemoji -c"

--##################
--## KEYBINDINGS ###
--##################
-- See https://wiki.hyprland.org/Configuring/Keywords/

hl.bind("SUPER + T", hl.dsp.exec_cmd("kitty"))
hl.bind("SUPER + Q", hl.dsp.window.close(), { description = "Window: Close" })
hl.bind("SUPER + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind("SUPER + E", hl.dsp.exec_cmd("nautilus"))
hl.bind("SUPER + V", hl.dsp.exec_cmd("~/.config/hypr/scripts/clipboard"))
hl.bind("SUPER + space", hl.dsp.exec_cmd("pkill rofi; rofi -show combi"))
hl.bind("SUPER + R", hl.dsp.exec_cmd("pkill rofi; rofi -show run"))
hl.bind("SUPER + CTRL + R", hl.dsp.exec_cmd("~/.config/hypr/scripts/monitor-control reset"))
hl.bind("CTRL + ALT + space", hl.dsp.exec_cmd("bemoji -c"))
hl.bind("SHIFT + CTRL + escape", hl.dsp.exec_cmd("gnome-system-monitor"))

-- Screenshots
hl.bind("SHIFT + ALT + 3", hl.dsp.exec_cmd("~/.config/hypr/scripts/screenshots screen"))
hl.bind("SHIFT + ALT + 4", hl.dsp.exec_cmd("~/.config/hypr/scripts/screenshots area"))

-- Window controls
hl.bind("SUPER + F", hl.dsp.window.float())
hl.bind("SUPER + SHIFT + F", hl.dsp.window.fullscreen())
hl.bind("SUPER + CTRL + F", hl.dsp.window.float())
hl.bind("SUPER + CTRL + F", hl.dsp.window.pin())
hl.bind("SUPER + P", hl.dsp.window.pseudo())

-- dwindle
hl.bind("SUPER + J", hl.dsp.layout("togglesplit"))

-- Move focus with mainMod + arrow keys
hl.bind("SUPER + left", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + right", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + up", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + down", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
hl.bind("SUPER + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind("SUPER + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind("SUPER + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind("SUPER + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind("SUPER + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind("SUPER + 6", hl.dsp.focus({ workspace = 6 }))
hl.bind("SUPER + 7", hl.dsp.focus({ workspace = 7 }))
hl.bind("SUPER + 8", hl.dsp.focus({ workspace = 8 }))
hl.bind("SUPER + 9", hl.dsp.focus({ workspace = 9 }))
hl.bind("SUPER + 0", hl.dsp.focus({ workspace = 10 }))

-- Move active window to a workspace with mainMod + SHIFT + [0-9]
hl.bind("SUPER + SHIFT" .. " + " .. 1, hl.dsp.window.move({ workspace = 1 }))
hl.bind("SUPER + SHIFT" .. " + " .. 2, hl.dsp.window.move({ workspace = 2 }))
hl.bind("SUPER + SHIFT" .. " + " .. 3, hl.dsp.window.move({ workspace = 3 }))
hl.bind("SUPER + SHIFT" .. " + " .. 4, hl.dsp.window.move({ workspace = 4 }))
hl.bind("SUPER + SHIFT" .. " + " .. 5, hl.dsp.window.move({ workspace = 5 }))
hl.bind("SUPER + SHIFT" .. " + " .. 6, hl.dsp.window.move({ workspace = 6 }))
hl.bind("SUPER + SHIFT" .. " + " .. 7, hl.dsp.window.move({ workspace = 7 }))
hl.bind("SUPER + SHIFT" .. " + " .. 8, hl.dsp.window.move({ workspace = 8 }))
hl.bind("SUPER + SHIFT" .. " + " .. 9, hl.dsp.window.move({ workspace = 9 }))
hl.bind("SUPER + SHIFT" .. " + " .. 0, hl.dsp.window.move({ workspace = 10 }))

-- Example special workspace (scratchpad)
hl.bind("SUPER + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind("SUPER + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+"), { locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"), { locked = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
