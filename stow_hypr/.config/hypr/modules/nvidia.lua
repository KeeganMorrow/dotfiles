return function()
	hl.env("LIBVA_DRIVER_NAME", "nvidia")
	hl.env("MOZ_ENABLE_WAYLAND", "1")
	hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")

	-- Present in hyprland.conf.old, but no longer a default Nvidia recommendation.
	-- Re-enable only if your stack specifically needs it.
	-- hl.env("GBM_BACKEND", "nvidia-drm")

	hl.config({
		cursor = {
			-- cursor:no_hardware_cursors is now an int: 0 = off, 1 = on, 2 = auto.
			no_hardware_cursors = 1,
			no_warps = true,
		},

		debug = {
			full_cm_proto = true,
		},
	})
end
