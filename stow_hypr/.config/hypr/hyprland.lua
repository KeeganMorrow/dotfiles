local ctx = {
	home = os.getenv("HOME"),
	colors = require("catppuccin-hyprland/themes/catppuccin-mocha"),

	terminal = "alacritty",
	fileManager = "thunar",
	menu = "fuzzel",
	mainMod = "SUPER",
}

local modules = {
	"modules.monitors",
	"modules.workspaces",
	"modules.env",
	"modules.nvidia",
	"modules.appearance",
	"modules.animations",
	"modules.input",
	"modules.binds",
	"modules.rules",
	"modules.autostart",
}

for _, module in ipairs(modules) do
	require(module)(ctx)
end
