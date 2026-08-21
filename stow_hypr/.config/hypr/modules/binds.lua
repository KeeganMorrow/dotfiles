return function(ctx)
	local mod = ctx.mainMod

	hl.bind(mod .. " + Return", hl.dsp.exec_cmd("uwsm app -- " .. ctx.terminal .. " -e tmux -2"))

	hl.bind(mod .. " + SHIFT + Q", function()
		local window = hl.get_active_window()

		if window and window.class == "Steam" then
			hl.exec_cmd("xdotool getactivewindow windowunmap")
		else
			hl.dispatch(hl.dsp.window.close())
		end
	end)

	hl.bind(mod .. " + SHIFT + E", hl.dsp.exec_cmd("uwsm app -- lua ~/dotfiles/bin/fuzzel-power-menu"))
	hl.bind(mod .. " + E", hl.dsp.exec_cmd("uwsm app -- " .. ctx.fileManager))
	hl.bind(mod .. " + V", hl.dsp.window.float({ action = "toggle" }))
	hl.bind(mod .. " + R", hl.dsp.exec_cmd("uwsm app -- " .. ctx.menu))
	hl.bind(mod .. " + P", hl.dsp.window.pseudo())

	-- hl.bind(mod .. " + N", hl.dsp.layout("togglesplit"))

	hl.bind(
		mod .. " + SHIFT + Return",
		hl.dsp.exec_cmd("TERMINAL=" .. ctx.terminal .. " ~/dotfiles/bin/rofi_tmux.sh -location 2")
	)

	hl.bind(mod .. " + h", hl.dsp.focus({ direction = "left" }))
	hl.bind(mod .. " + l", hl.dsp.focus({ direction = "right" }))
	hl.bind(mod .. " + j", hl.dsp.focus({ direction = "up" }))
	hl.bind(mod .. " + k", hl.dsp.focus({ direction = "down" }))

	for i = 1, 10 do
		local key = i % 10

		hl.bind(mod .. " + " .. key, hl.dsp.focus({ workspace = i }))
		hl.bind(mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
	end

	hl.bind(mod .. " + SHIFT + F", hl.dsp.window.fullscreen({ action = "toggle" }))
	hl.bind(mod .. " + m", hl.dsp.layout("swapwithmaster"))
	hl.bind(mod .. " + Escape", hl.dsp.exec_cmd("pidof swaylock || uwsm app -- swaylock"))

	hl.bind(mod .. " + s", hl.dsp.exec_cmd("grimblast copysave active"))
	hl.bind(mod .. " + SHIFT + s", hl.dsp.exec_cmd("grimblast copy area"))

	hl.bind(mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
	hl.bind(mod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

	hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
	hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

	-- hl.bind(mod .. " + S", hl.dsp.workspace.toggle_special("magic"))
	-- hl.bind(mod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))
	-- hl.bind(mod .. " + tab", hl.dsp.exec_cmd("hyprexpo:expo toggle"))
end
