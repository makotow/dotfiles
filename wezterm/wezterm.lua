-- =========================================================
-- Wezterm Configuration
-- =========================================================
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- =========================================================
-- Load Modules
-- =========================================================
-- These modules export an `apply_to_config(config)` function
-- that modifies the configuration object in place.

require("general").apply_to_config(config)
require("appearance").apply_to_config(config)
require("keybinds").apply_to_config(config)

-- =========================================================
-- Final Config
-- =========================================================
return config
