return function()
	local suppressMaximizeRule = hl.window_rule({
		name = "suppress-maximize-events",
		match = { class = ".*" },

		suppress_event = "maximize",
	})
	-- suppressMaximizeRule:set_enabled(false)

	hl.window_rule({
		name = "fix-xwayland-drags",
		match = {
			class = "^$",
			title = "^$",
			xwayland = true,
			float = true,
			fullscreen = false,
			pin = false,
		},

		no_focus = true,
	})

	hl.window_rule({
		name = "xwayland-video-bridge-fixes",
		match = {
			class = "xwaylandvideobridge",
		},

		no_initial_focus = true,
		no_focus = true,
		no_anim = true,
		no_blur = true,
		max_size = { 1, 1 },
		opacity = 0.0,
	})

	hl.window_rule({
		match = {
			title = "^SteamTinkerLaunch.*$",
		},

		float = true,
	})

	hl.window_rule({
		name = "move-hyprland-run",
		match = { class = "hyprland-run" },

		move = "20 monitor_h-120",
		float = true,
	})
end
