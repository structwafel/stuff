local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.font = wezterm.font 'NotoMono Nerd Font'
config.color_scheme = 'Gruvbox dark, hard (base16)'
config.window_decorations = "NONE"
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
config.use_fancy_tab_bar = false
config.enable_tab_bar = false
config.window_close_confirmation = "NeverPrompt"


return config
