local wezterm = require 'wezterm' -- Pull in API
local config = wezterm.config_builder()
config.initial_cols = 100
config.initial_rows = 25 
config.font_size = 16
config.color_scheme = 'MaterialDark'
return config
