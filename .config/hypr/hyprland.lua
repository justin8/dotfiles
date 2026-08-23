---@module 'hl'
hl.config({
    debug = {
        disable_logs = false
    }
})

-- ################
-- ## AUTOSTART ###
-- ################
hl.on("hyprland.start", function()
    hl.exec_cmd("sleep 2 && ~/.config/hypr/scripts/monitor-control reset")
    hl.exec_cmd("wayle panel start")
    hl.exec_cmd("udiskie --automount --smart-tray")
    -- hl.exec_cmd("hypridle &> ~/.hypridle.log")
    hl.exec_cmd("~/.config/hypr/scripts/wallpaper-rotator &> ~/.swaybg.log")
    hl.exec_cmd("wl-paste --watch cliphist store")
    hl.exec_cmd("sunshine")
    hl.exec_cmd("MoonDeckBuddy")
    hl.exec_cmd("easyeffects --gapplication-service")
    hl.exec_cmd("[workspace 1 silent] zen-browser")
    hl.exec_cmd(
        "[workspace 10 silent] flatpak 'run' '--command=/app/bin/chrome' 'com.google.Chrome' '--profile-directory=Default' '--app-id=cinhimbnkkaeohfgghhklpknlkffjgod'")
    hl.exec_cmd("[workspace 2 silent] steam -nochatui -nofriendsui -silent")
    hl.exec_cmd("[workspace special:magic silent] obsidian")
end)

-- ############################
-- ## ENVIRONMENT VARIABLES ###
-- ############################
-- See https://wiki.hyprland.org/Configuring/Environment-variables/
hl.env("XCURSOR_SIZE", 24)
hl.env("HYPRCURSOR_SIZE", 24)
hl.env("GDK_GL", "gles")

hl.config({
    dwindle = {
        preserve_split = true
    }
})

hl.config({
    master = {
        new_status = "master"
    }
})

hl.config({
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true
    }
})

-- ############
-- ## INPUT ###
-- ############
-- https://wiki.hyprland.org/Configuring/Variables/#input

hl.config({
    input = {
        kb_layout = "us",
        numlock_by_default = true,
        accel_profile = "flat",
        follow_mouse = 1,
        sensitivity = 0.9, -- -1.0 - 1.0, 0 means no modification.
        touchpad = {
            natural_scroll = false
        }
    }
})

require("~/.config/hypr/conf.d/*.lua")
