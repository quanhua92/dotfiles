-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.font_size = 14
config.color_scheme = "Catppuccin Mocha"
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.9

return config
