---@module 'hl'
hl.env("GTK_THEME", "Catppuccin-Dark")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("XCURSOR_SIZE", 24)
hl.env("HYPRCURSOR_SIZE", 24)
hl.env("PROTON_ENABLE_WAYLAND", 1)

hl.bind("SUPER + CTRL + R", hl.dsp.exec_cmd("~/.config/hypr/scripts/monitor-control reset"))

hl.config({
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
        vrr = 1,
    },
    render = {
        direct_scanout = 1,
    },
    cursor = {
        no_break_fs_vrr = 1,
    },
})

hl.config({
    input = {
        kb_layout = "us",
        numlock_by_default = true,
        accel_profile = "flat",
        follow_mouse = 1,
        sensitivity = 0.9, -- -1.0 - 1.0, 0 means no modification.
    },
})
