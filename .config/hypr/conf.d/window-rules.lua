---@module 'hl'
-- #############################
-- ## WINDOWS AND WORKSPACES ###
-- #############################
-- Floats
hl.window_rule({
    name = "float-nautilus",
    match = {
        class = "org.gnome.Nautilus"
    },
    float = true
})

hl.window_rule({
    name = "float-nautilus-previewer",
    match = {
        class = "org.gnome.NautilusPreviewer"
    },
    float = true
})

-- windowrulev2 = float,title:^(About Mozilla Firefox)$
hl.window_rule({
    name = "float-floorp-pip",
    match = {
        class = "floorp",
        title = "Picture-in-Picture"
    },
    float = true
})

hl.window_rule({
    name = "float-floorp-library",
    match = {
        class = "floorp",
        title = "Library"
    },
    float = true
})

hl.window_rule({
    name = "float-floorp-extension",
    match = {
        class = "floorp",
        title = "Extension"
    },
    float = true -- this doesn't work.. not sure why yet
})

hl.window_rule({
    name = "float-qt5ct",
    match = {
        class = "qt5ct"
    },
    float = true
})

hl.window_rule({
    name = "float-qt6ct",
    match = {
        class = "qt6ct"
    },
    float = true
})

hl.window_rule({
    name = "float-pavucontrol",
    match = {
        class = "org.pulseaudio.pavucontrol"
    },
    float = true
})

hl.window_rule({
    name = "float-blueman-manager",
    match = {
        class = "blueman-manager"
    },
    float = true
})

hl.window_rule({
    name = "float-nm-applet",
    match = {
        class = "nm-applet"
    },
    float = true
})

hl.window_rule({
    name = "float-nm-connection-editor",
    match = {
        class = "nm-connection-editor"
    },
    float = true
})

hl.window_rule({
    name = "float-system-monitor",
    match = {
        class = "org.gnome.SystemMonitor"
    },
    float = true
})

hl.window_rule({
    name = "float-obsidian",
    match = {
        class = "md.obsidian.Obsidian"
    },
    float = true
})

hl.window_rule({
    name = "float-calculator",
    match = {
        class = "org.gnome.Calculator"
    },
    float = true
})

hl.window_rule({
    name = "float-easyeffects",
    match = {
        class = "com.github.wwmm.easyeffects"
    },
    float = true
})

hl.window_rule({
    name = "float-picture-in-picture",
    match = {
        class = "Picture-in-Picture"
    },
    float = true
})

hl.window_rule({
    name = "float-wayle-settings",
    match = {
        class = "com.wayle.settings"
    },
    float = true
})

-- Mappings

hl.window_rule({
    name = "workspace-spotify",
    match = {
        class = "^(Spotify)$"
    },
    workspace = "10 silent"
})

hl.window_rule({
    name = "workspace-youtube-music",
    match = {
        title = "^(YouTube Music)$"
    },
    workspace = "10 silent"
})

hl.window_rule({
    name = "workspace-discord",
    match = {
        class = "^(discord)$"
    },
    workspace = "9"
})

hl.window_rule({
    name = "workspace-vesktop",
    match = {
        class = "^(vesktop)$"
    },
    workspace = "9"
})

hl.window_rule({
    name = "workspace-obs-studio",
    match = {
        class = "^(com.obsproject.Studio)$"
    },
    workspace = 10
})

-- Games
hl.window_rule({
    name = "workspace-steam-client",
    match = {
        class = "steam",
        title = "(Steam|Friends List)"
    },
    workspace = 2
})

hl.window_rule({
    name = "workspace-heroic-launcher",
    match = {
        class = "com.heroicgameslauncher.hgl"
    },
    workspace = 2
})

hl.window_rule({
    name = "float-protonfixes",
    match = {
        title = "ProtonFixes"
    },
    float = true
})

hl.window_rule({
    name = "fullscreen-no-rounding-border",
    match = {
        fullscreen = true
    },
    rounding = 0,
    border_size = 0
})

hl.window_rule({
    name = "workspace-steam-big-picture",
    match = {
        title = "Steam Big Picture Mode"
    },
    workspace = 3
})

hl.window_rule({
    name = "games",
    match = {
        initial_class = "^(steam_app_.*|gamescope.*|factorio|Soulstone-Survivors.*|Necesse.*|GeForce NOW|Megabonk.*|TPH.*|pioneergame.*|Terraria.*|com\\.moonlight_stream\\.Moonlight)$"
    },
    workspace = 3
})

-- Plex
hl.window_rule({
    name = "app-plex",
    match = {
        class = "Plex"
    },
    fullscreen = true,
    workspace = 8
})

-- Transparency
hl.window_rule({
    name = "opacity-code",
    match = {
        class = "code-url-handler"
    },
    opacity = 0.90
})

hl.window_rule({
    name = "opacity-steam",
    match = {
        class = "steam"
    },
    opacity = 0.85
})

hl.window_rule({
    name = "opacity-spotify",
    match = {
        class = "Spotify"
    },
    opacity = 0.80
})

-- Other rules
hl.window_rule({
    -- Don't idle during full screen
    name = "idle-inhibit-fullscreen",
    match = {
        fullscreen_state_client = 2
    },
    idle_inhibit = "fullscreen"
})

-- Wlogout
hl.window_rule({
    name = "app-wlogout",
    match = {
        class = "Wlogout"
    },
    fullscreen = true,
    float = true,
    no_anim = true
})

hl.layer_rule({
    name = "blur-logout-dialog",
    match = {
        namespace = "logout_dialog"
    },
    blur = true
})
