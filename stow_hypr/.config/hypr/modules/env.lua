return function(ctx)
	-- If this is launched through uwsm, prefer moving non-HYPR/AQ variables to
	-- ~/.config/uwsm/env and HYPR*/AQ_* variables to ~/.config/uwsm/env-hyprland.
	hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
	hl.env("XDG_SESSION_TYPE", "wayland")
	hl.env("XDG_SESSION_DESKTOP", "Hyprland")
	hl.env("WEBKIT_DISABLE_COMPOSITING_MODE", "1")
	hl.env("NVD_BACKEND", "direct")

	hl.env("XCURSOR_SIZE", "24")
	hl.env("HYPRCURSOR_SIZE", "24")
	hl.env("XDG_SCREENSHOTS_DIR", ctx.home .. "/keegan/Screenshots")
end
