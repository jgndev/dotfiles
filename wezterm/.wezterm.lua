-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Font related
config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
-- config.font = wezterm.font("Hack Nerd Font Mono")
config.font_size = 16.0
-- config.dpi = 144.0
config.freetype_load_flags = "NO_HINTING"

-- Colorscheme
config.color_scheme = "Catppuccin Mocha"

-- Window Decorations
config.window_decorations = "RESIZE"

-- GPU Accelerated
config.front_end = "WebGpu"

-- Disable update notifications
config.check_for_updates = false
config.show_update_window = false

return config
