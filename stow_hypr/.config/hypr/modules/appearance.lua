return function(ctx)
	hl.config({
		general = {
			gaps_in = 8,
			gaps_out = { 0, 4, 4, 4 },

			border_size = 2,

			col = {
				active_border = {
					colors = {
						"rgba(" .. ctx.colors.lavenderAlpha .. "ee)",
						"rgba(" .. ctx.colors.lavenderAlpha .. "ff)",
					},
					angle = 45,
				},
				inactive_border = "rgba(" .. ctx.colors.overlay0Alpha .. "aa)",
			},

			resize_on_border = false,
			allow_tearing = false,

			layout = "master",
		},

		decoration = {
			rounding = 5,
			rounding_power = 2,

			active_opacity = 1.0,
			inactive_opacity = 1.0,

			shadow = {
				enabled = true,
				range = 4,
				render_power = 2,
				color = "rgba(" .. ctx.colors.baseAlpha .. "ff)",
			},

			blur = {
				enabled = true,
				size = 3,
				passes = 1,
				vibrancy = 0.1696,
			},
		},

		animations = {
			enabled = true,
		},

		misc = {
			force_default_wallpaper = 0,
			disable_hyprland_logo = true,
			focus_on_activate = true,
		},
	})
end
