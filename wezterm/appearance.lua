local wezterm = require 'wezterm'

local module = {}

function module.apply_to_config(config)
  -- =========================================================
  -- Fonts
  -- =========================================================
  config.font_size = 14.0
  config.font = wezterm.font_with_fallback({
    "MesloLGS NF",
    "JetBrains Mono",
    "Apple Color Emoji",
    "Symbols Nerd Font Mono",
  })

  -- =========================================================
  -- Colors & Theme
  -- =========================================================
  config.color_scheme = 'Ayu Mirage'
  
  -- Custom colors overrides
  config.colors = {
      cursor_fg = "#11111b",
      cursor_bg = "#59c2c6",
      cursor_border = "#59c2c6",
  }

  -- =========================================================
  -- Window Look & Feel
  -- =========================================================
  config.window_background_opacity = 0.85
  config.macos_window_background_blur = 10
  config.window_decorations = "RESIZE" -- No title bar, but resizable

  config.window_frame = {
    inactive_titlebar_bg = "none",
    active_titlebar_bg = "none",
  }

  config.inactive_pane_hsb = {
    saturation = 0.5,
    brightness = 0.4,
  }

  config.default_cursor_style = "SteadyBlock"

  -- =========================================================
  -- Tab Bar
  -- =========================================================
  -- Disable default fancy tab bar as we are using a plugin
  config.use_fancy_tab_bar = false
  config.show_new_tab_button_in_tab_bar = false
  config.show_tab_index_in_tab_bar = false
  config.tab_bar_at_bottom = false

  -- External Plugin: Tabline
  -- https://github.com/michaelbrusegard/tabline.wez
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
end

return module
