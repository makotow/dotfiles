local wezterm = require 'wezterm'

local module = {}

function module.apply_to_config(config)
  -- Config files will be automatically reloaded when they are changed
  config.automatically_reload_config = true

  -- Enable IME (Input Method Editor) support
  config.use_ime = true

  -- Hide the tab bar if there is only one tab
  config.hide_tab_bar_if_only_one_tab = true

  -- Initial window size
  config.initial_rows = 40
  config.initial_cols = 140
end

return module
