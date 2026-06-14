---@diagnostic disable: undefined-global
hl.on("hyprland.start", function()
	-- Environment for xdg-desktop-portal-hyprland
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	-- Vaina para que keepas funcione como gestor ssh y cuando esté la base de datos desbloqueada no me pida contraseña el push y tal :)
	hl.exec_cmd(
		"dbus-update-activation-environment --systemd SSH_AUTH_SOCK && systemctl --user import-environment SSH_AUTH_SOCK && ssh-agent -a $XDG_RUNTIME_DIR/ssh-agent.socket"
	)
	-- Restore wallpaper
	-- hl.exec_cmd("~/.config/ml4w/scripts/ml4w-wallpaper-app --restore")
	hl.exec_cmd("waypaper --restore")
	-- Start listeners
	hl.exec_cmd("~/.config/ml4w/listeners.sh --startall")
	-- Start polkit daemon
	hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
	-- Autostart scripts
	hl.exec_cmd("~/.config/ml4w/scripts/ml4w-autostart")
	-- Load GTK settings
	hl.exec_cmd("~/.config/hypr/scripts/gtk.sh")
	-- Start swaync
	hl.exec_cmd("swaync")
	-- Start orbit wifi and bluetooth manager daemon
	hl.exec_cmd("orbit daemon &")
	-- Start hypridle
	hl.exec_cmd("hypridle")
	-- Load cliphist history
	hl.exec_cmd("wl-paste --watch cliphist store")
	-- Start ALT + TAB daemon
	hl.exec_cmd("snappy-switcher --daemon &")
	-- Start autostart cleanup
	hl.exec_cmd("~/.config/hypr/scripts/cleanup.sh")
end)
