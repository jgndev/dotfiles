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
-- config.color_scheme = "Catppuccin Mocha (Gogh)"
config.color_scheme = "kanagawabones"

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
}

return config
