-- pull in wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.automatically_reload_config = true
config.font_size = 14.0
config.use_ime = true
config.window_background_opacity = 0.85
config.macos_window_background_blur = 10
config.hide_tab_bar_if_only_one_tab = true

config.window_frame = {
  inactive_titlebar_bg = "none",
  active_titlebar_bg = "none",
}

config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.show_tab_index_in_tab_bar = false
config.tab_bar_at_bottom = false
config.window_decorations = "RESIZE"

local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
tabline.setup({
    options = {
        theme = 'Ayu Mirage',
        section_separators = {
            left = wezterm.nerdfonts.pl_left_soft_divider,
            right = wezterm.nerdfonts.pl_right_soft_divider,
        },
        component_separators = {
            left = wezterm.nerdfonts.pl_left_soft_divider,
            right = wezterm.nerdfonts.pl_right_soft_divider,
        },
        tab_separators = {
            left = wezterm.nerdfonts.pl_left_hard_divider,
            right = wezterm.nerdfonts.pl_right_hard_divider,
        },
    }
})

config.inactive_pane_hsb = {
  saturation = 0.5,
  brightness = 0.4,
}

config.default_cursor_style = "SteadyBlock"
config.colors = {
    cursor_fg = "#11111b",
    cursor_bg = "#59c2c6",
    cursor_border = "#59c2c6",
}

config.font = wezterm.font_with_fallback({
  "MesloLGS NF",
  "JetBrains Mono",
  "Apple Color Emoji",
  "Symbols Nerd Font Mono",
})

config.color_scheme = 'Ayu Mirage'

config.initial_rows = 40
config.initial_cols = 140
config.leader = { key = "q", mods = "CTRL", timeout_milliseconds = 2000 }

config.keys = require("keybind").keys

return config
