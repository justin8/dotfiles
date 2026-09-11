---@module 'hl'
hl.env("GTK_THEME", "Catppuccin-Dark")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("XCURSOR_SIZE", 24)
hl.env("HYPRCURSOR_SIZE", 24)

hl.config({
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true
    }
})

hl.config({
    input = {
        kb_layout = "us",
        numlock_by_default = true,
        accel_profile = "flat",
        follow_mouse = 1,
        sensitivity = 0.9 -- -1.0 - 1.0, 0 means no modification.
    }
})
