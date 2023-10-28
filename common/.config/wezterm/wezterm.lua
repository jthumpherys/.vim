local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "duskfox"
config.font = wezterm.font_with_fallback {
  {
    wezterm.font("CaskaydiaCove Nerd Font Mono", { weight = "SemiLight" })
  },
  "Fira Code",
}
config.font_size = 8

return config
