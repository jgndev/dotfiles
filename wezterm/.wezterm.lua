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

-- Colorscheme
config.color_scheme = "tokyonight_night"
-- config.color_scheme = "Catppuccin Mocha (Gogh)"
-- config.color_scheme = "kanagawabones"
-- config.colors = {
--   foreground = "#dcd7ba",
--   background = "#1f1f28",
--
--   cursor_bg = "#c8c093",
--   cursor_fg = "#c8c093",
--   cursor_border = "#c8c093",
--
--   selection_fg = "#c8c093",
--   selection_bg = "#2d4f67",
--
--   scrollbar_thumb = "#16161d",
--   split = "#16161d",
--
--   ansi = { "#090618", "#c34043", "#76946a", "#c0a36e", "#7e9cd8", "#957fb8", "#6a9589", "#c8c093" },
--   brights = { "#727169", "#e82424", "#98bb6c", "#e6c384", "#7fb4ca", "#938aa9", "#7aa89f", "#dcd7ba" },
--   indexed = { [16] = "#ffa066", [17] = "#ff5d62" },
-- }

-- Window Decorations
config.window_decorations = "NONE|RESIZE"

-- GPU Accelerated
config.front_end = "WebGpu"

-- Splits
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
	{
		key = "J",
		mods = "CTRL",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		key = "K",
		mods = "CTRL",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
}

return config
