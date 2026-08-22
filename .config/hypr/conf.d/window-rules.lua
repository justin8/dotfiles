---@module 'hl'
-- #############################
-- ## WINDOWS AND WORKSPACES ###
-- #############################
-- Floats
hl.window_rule({
	name = "float-nautilus",
	match = {
		class = "org.gnome.Nautilus",
	},
	float = true,
})

hl.window_rule({
	name = "float-nautilus-previewer",
	match = {
		class = "org.gnome.NautilusPreviewer",
	},
	float = true,
})

-- windowrulev2 = float,title:^(About Mozilla Firefox)$
hl.window_rule({
	name = "float-floorp-pip",
	match = {
		class = "floorp",
		title = "Picture-in-Picture",
	},
	float = true,
})

hl.window_rule({
	name = "float-floorp-library",
	match = {
		class = "floorp",
		title = "Library",
	},
	float = true,
})

hl.window_rule({
	name = "float-floorp-extension",
	match = {
		class = "floorp",
		title = "Extension",
	},
	float = true, -- this doesn't work.. not sure why yet
})

hl.window_rule({
	name = "float-qt5ct",
	match = {
		class = "qt5ct",
	},
	float = true,
})

hl.window_rule({
	name = "float-qt6ct",
	match = {
		class = "qt6ct",
	},
	float = true,
})

hl.window_rule({
	name = "float-pavucontrol",
	match = {
		class = "org.pulseaudio.pavucontrol",
	},
	float = true,
})

hl.window_rule({
	name = "float-blueman-manager",
	match = {
		class = "blueman-manager",
	},
	float = true,
})

hl.window_rule({
	name = "float-nm-applet",
	match = {
		class = "nm-applet",
	},
	float = true,
})

hl.window_rule({
	name = "float-nm-connection-editor",
	match = {
		class = "nm-connection-editor",
	},
	float = true,
})

hl.window_rule({
	name = "float-system-monitor",
	match = {
		class = "org.gnome.SystemMonitor",
	},
	float = true,
})

hl.window_rule({
	name = "float-obsidian",
	match = {
		class = "md.obsidian.Obsidian",
	},
	float = true,
})

hl.window_rule({
	name = "float-calculator",
	match = {
		class = "org.gnome.Calculator",
	},
	float = true,
})

hl.window_rule({
	name = "float-easyeffects",
	match = {
		class = "com.github.wwmm.easyeffects",
	},
	float = true,
})

hl.window_rule({
	name = "float-picture-in-picture",
	match = {
		class = "Picture-in-Picture",
	},
	float = true,
})

hl.window_rule({
	name = "float-wayle-settings",
	match = {
		class = "com.wayle.settings",
	},
	float = true,
})

-- Mappings

hl.window_rule({
	name = "workspace-spotify",
	match = {
		class = "^(Spotify)$",
	},
	workspace = "10 silent",
})

hl.window_rule({
	name = "workspace-youtube-music",
	match = {
		title = "^(YouTube Music)$",
	},
	workspace = "10 silent",
})

hl.window_rule({
	name = "workspace-discord",
	match = {
		class = "^(discord)$",
	},
	workspace = "9",
})

hl.window_rule({
	name = "workspace-vesktop",
	match = {
		class = "^(vesktop)$",
	},
	workspace = "9",
})

hl.window_rule({
	name = "workspace-obs-studio",
	match = {
		class = "^(com.obsproject.Studio)$",
	},
	workspace = 10,
})

-- Games
hl.window_rule({
	name = "workspace-steam-client",
	match = {
		class = "steam",
		title = "(Steam|Friends List)",
	},
	workspace = 2,
})

hl.window_rule({
	name = "workspace-heroic-launcher",
	match = {
		class = "com.heroicgameslauncher.hgl",
	},
	workspace = 2,
})

hl.window_rule({
	name = "float-protonfixes",
	match = {
		title = "ProtonFixes",
	},
	float = true,
})

hl.window_rule({
	name = "fullscreen-no-rounding-border",
	match = {
		fullscreen = true,
	},
	rounding = 0,
	border_size = 0,
})

hl.window_rule({
	name = "workspace-steam-big-picture",
	match = {
		title = "Steam Big Picture Mode",
	},
	workspace = 3,
})

hl.window_rule({
	name = "game-steam-app",
	match = {
		class = "steam_app_.*",
	},
	workspace = 3,
	fullscreen = true,
	immediate = true,
})

hl.window_rule({
	name = "game-gamescope",
	match = {
		class = "gamescope.*",
	},
	workspace = 3,
	fullscreen = true,
})

hl.window_rule({
	name = "game-factorio",
	match = {
		class = "factorio",
	},
	workspace = 3,
})

hl.window_rule({
	name = "game-soulstone-survivors",
	match = {
		class = "Soulstone-Survivors.x86_64",
	},
	workspace = 3,
})

hl.window_rule({
	name = "game-guild-wars-2",
	match = {
		title = "Guild Wars 2",
	},
	no_blur = true,
	border_size = 0,
})

hl.window_rule({
	name = "game-necesse",
	match = {
		class = "Necesse.*",
		fullscreen = true,
	},
	workspace = 3,
})

hl.window_rule({
	name = "game-geforce-now",
	match = {
		class = "GeForce NOW",
	},
	workspace = 3,
})

hl.window_rule({
	name = "game-megabonk",
	match = {
		class = "Megabonk.x86_64",
	},
	workspace = 3,
})

hl.window_rule({
	-- ARC Raiders
	name = "game-arc-raiders",
	match = {
		class = "pioneergame.exe",
	},
	workspace = 3,
})

hl.window_rule({
	-- ARC Radiers EAC setup
	name = "game-arc-raiders-eac",
	match = {
		class = "steam_app_1808500",
	},
	workspace = "7 silent",
	size = "100 100",
})

hl.window_rule({
	name = "game-terraria",
	match = {
		class = "Terraria.bin.x86_64",
	},
	workspace = 3,
	float = true,
	border_size = 0,
	size = "3440 1440",
})

hl.window_rule({
	name = "float-ubisoft-connect",
	match = {
		title = "Ubisoft Connect",
	},
	float = true,
})

hl.window_rule({
	name = "game-moonlight",
	match = {
		class = "com.moonlight_stream.Moonlight",
	},
	workspace = 3,
	fullscreen = true,
})

hl.window_rule({
	name = "workspace-godot",
	match = {
		title = "Godot",
	},
	workspace = 3,
})

hl.window_rule({
	name = "game-spiderman-miles-morales",
	match = {
		title = "Marvel's Spider-Man: Miles Morales",
	},
	workspace = 3,
	float = true,
	fullscreen = false,
})

-- Plex
hl.window_rule({
	name = "app-plex",
	match = {
		class = "Plex",
	},
	fullscreen = true,
	workspace = 8,
})

-- Transparency
hl.window_rule({
	name = "opacity-code",
	match = {
		class = "code-url-handler",
	},
	opacity = 0.90,
})

hl.window_rule({
	name = "opacity-steam",
	match = {
		class = "steam",
	},
	opacity = 0.85,
})

hl.window_rule({
	name = "opacity-spotify",
	match = {
		class = "Spotify",
	},
	opacity = 0.80,
})

-- Other rules
hl.window_rule({
	-- Don't idle during full screen
	name = "idle-inhibit-fullscreen",
	match = {
		fullscreen_state_client = 2,
	},
	idle_inhibit = "fullscreen",
})

-- Wlogout
hl.window_rule({
	name = "app-wlogout",
	match = {
		class = "Wlogout",
	},
	fullscreen = true,
	float = true,
	no_anim = true,
})

hl.layer_rule({
	name = "blur-logout-dialog",
	match = {
		namespace = "logout_dialog",
	},
	blur = true,
})
