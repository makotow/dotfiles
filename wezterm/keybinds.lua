local wezterm = require 'wezterm'
local act = wezterm.action

local module = {}

function module.apply_to_config(config)
  -- =========================================================
  -- Leader Key
  -- =========================================================
  -- Set leader key to Ctrl+q
  config.leader = { key = "q", mods = "CTRL", timeout_milliseconds = 2000 }

  -- =========================================================
  -- Key Assignments
  -- =========================================================
  config.keys = {
    -- Split Horizontal: Leader + | (Shift + \)
    { 
      key = '|', 
      mods = 'LEADER|SHIFT', 
      action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } 
    },
    -- Split Vertical: Leader + -
    { 
      key = '-', 
      mods = 'LEADER', 
      action = act.SplitVertical { domain = 'CurrentPaneDomain' } 
    },
    
    -- Close Pane: Leader + x
    { 
      key = 'x', 
      mods = 'LEADER', 
      action = act.CloseCurrentPane { confirm = true } 
    },
    
    -- Toggle Zoom (Maximize) Pane: Leader + z
    { 
      key = 'z', 
      mods = 'LEADER', 
      action = act.TogglePaneZoomState 
    },

    -- =========================================================
    -- Pane Navigation
    -- =========================================================
    -- Activate Pane: Alt + Arrow
    { key = 'LeftArrow', mods = 'ALT', action = act.ActivatePaneDirection 'Left' },
    { key = 'RightArrow', mods = 'ALT', action = act.ActivatePaneDirection 'Right' },
    { key = 'UpArrow', mods = 'ALT', action = act.ActivatePaneDirection 'Up' },
    { key = 'DownArrow', mods = 'ALT', action = act.ActivatePaneDirection 'Down' },
    
    -- Activate Pane: Leader + hjkl
    { key = 'h', mods = 'LEADER', action = act.ActivatePaneDirection 'Left' },
    { key = 'l', mods = 'LEADER', action = act.ActivatePaneDirection 'Right' },
    { key = 'k', mods = 'LEADER', action = act.ActivatePaneDirection 'Up' },
    { key = 'j', mods = 'LEADER', action = act.ActivatePaneDirection 'Down' },
    
    -- Cycle Panes
    { key = 'n', mods = 'LEADER', action = act.ActivatePaneDirection 'Next' },
    { key = 'p', mods = 'LEADER', action = act.ActivatePaneDirection 'Prev' },

    -- =========================================================
    -- Pane Resizing
    -- =========================================================
    -- Resize Pane: Alt + Shift + Arrow
    { key = 'LeftArrow', mods = 'ALT|SHIFT', action = act.AdjustPaneSize { 'Left', 5 } },
    { key = 'RightArrow', mods = 'ALT|SHIFT', action = act.AdjustPaneSize { 'Right', 5 } },
    { key = 'UpArrow', mods = 'ALT|SHIFT', action = act.AdjustPaneSize { 'Up', 5 } },
    { key = 'DownArrow', mods = 'ALT|SHIFT', action = act.AdjustPaneSize { 'Down', 5 } },
    
    -- Resize Pane: Alt + Shift + hjkl
    { key = 'h', mods = 'ALT|SHIFT', action = act.AdjustPaneSize { 'Left', 5 } },
    { key = 'l', mods = 'ALT|SHIFT', action = act.AdjustPaneSize { 'Right', 5 } },
    { key = 'k', mods = 'ALT|SHIFT', action = act.AdjustPaneSize { 'Up', 5 } },
    { key = 'j', mods = 'ALT|SHIFT', action = act.AdjustPaneSize { 'Down', 5 } },
  }
end

return module
