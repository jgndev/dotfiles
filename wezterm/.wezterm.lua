-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Font related
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 15.0
-- config.dpi = 144.0
config.freetype_load_flags = "NO_HINTING"

-- Colorscheme
config.color_scheme = "kanagawabones"
-- config.color_scheme = "Gruvbox dark, hard (base16)"
-- config.color_scheme = "Gruvbox Material (Gogh)"

-- Window Decorations
config.window_decorations = "NONE|RESIZE"

-- GPU Accelerated
config.front_end = "WebGpu"

config.keys = {
	-- Vertical Split
	{
		key = "-",
		mods = "CTRL",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	-- Horizontl Split
	{
		key = "/",
		mods = "CTRL",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
}

return config
