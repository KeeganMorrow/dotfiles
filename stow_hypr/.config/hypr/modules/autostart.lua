return function()
	hl.on("hyprland.start", function()
		hl.exec_cmd("hyprctl output create headless")
		hl.exec_cmd("uwsm app -- sunshine")
		hl.exec_cmd("uwsm app -- dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
		hl.exec_cmd("uwsm app -- awww-daemon")
		hl.exec_cmd("uwsm app -- ~/dotfiles/bin/wallpaper_rot.sh")
		hl.exec_cmd("systemctl --user start hyprpolkitagent")
		hl.exec_cmd("uwsm app -- waycorner")
		hl.exec_cmd("uwsm app -- wayle panel start")
		hl.exec_cmd("uwsm app -- nm-applet")
		hl.exec_cmd(
			"uwsm app -- udiskie --smart-tray --no-automount --file-manager thunar --terminal 'alacritty --working-directory'"
		)

		-- causing problems
		-- hl.exec_cmd("uwsm app -- hypridle")

		hl.exec_cmd("uwsm app -- mullvad-vpn")
		hl.exec_cmd("uwsm app -- steam -silent")
		hl.exec_cmd("uwsm app -- discord --start-minimized")
		hl.exec_cmd("uwsm app -- jellyfin-mpv-shim")
		hl.exec_cmd("uwsm app -- qpwgraph --minimized")
	end)
end
