---@module 'hl'
--############################
--## ENVIRONMENT VARIABLES ###
--############################
-- See https://wiki.hyprland.org/Configuring/Environment-variables/

hl.env("XCURSOR_SIZE", 24)
hl.env("HYPRCURSOR_SIZE", 24)

--####################
--## LOOK AND FEEL ###
--####################
-- Refer to https://wiki.hyprland.org/Configuring/Variables/
-- https://wiki.hyprland.org/Configuring/Variables/#general

hl.config({
	general = {
		gaps_in = 3,
		gaps_out = 3,
		border_size = 3,
		resize_on_border = true,
		allow_tearing = false,
		layout = "dwindle",
		col = {
			active_border = { colors = { "rgba(c9cbffff)", "rgba(f5e0dcff)", "rgba(f2cdcdff)" }, angle = 45 },
			inactive_border = "rgba(595959aa)",
		},
	},
})

-- https://wiki.hyprland.org/Configuring/Variables/#decoration

hl.config({
	decoration = {
		rounding = 10,
		-- Change transparency of focused and unfocused windows
		active_opacity = 1.0,
		inactive_opacity = 1.0,
		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = "rgba(1a1a1aee)",
		},
		-- https://wiki.hyprland.org/Configuring/Variables/#blur
		blur = {
			enabled = true,
			size = 4,
			passes = 2,
			new_optimizations = true,
			xray = false,
			ignore_opacity = true,
			vibrancy = 0.1696,
		},
	},
})
