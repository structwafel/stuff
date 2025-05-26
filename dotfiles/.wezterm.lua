local wezterm = require 'wezterm'
local act = wezterm.action
local config = wezterm.config_builder()

config.font = wezterm.font 'NotoMono Nerd Font'
config.color_scheme = 'Gruvbox dark, hard (base16)'
config.window_decorations = "NONE"
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
config.use_fancy_tab_bar = false
config.enable_tab_bar = false
config.window_close_confirmation = "NeverPrompt"

-- config.keys =  {
--   {
--     key = 'c',
--     mods = 'CTRL',
--     action = wezterm.action_callback(function(window, pane)
--       local has_selection = pane:get_selecction_text() ~= ''
--       if has_selection then
--         --
--         window:perform_action(act.CopyTo('ClipboardAndPrimarySelection'), pane)
--         --
--         window:perform_action(act.ClearSelection, pane)
--         -- ? exit visual mode ?
--         -- window:perform_action(act.SendKey{key="Escape"}, pane)
--       else
--         -- just Ctrl+c normal
--         window:perform_action(act.SendKey { key = 'C', mods = 'CTRL' }, pane)
--       end
--     end)
--   },
--   {
--     key = 'V',
--     mods = 'CTRL',
--     action = act.PasteFrom 'Clipboard', -- Paste from the system clipboard
--   },
-- }

config.keys = {
  {
    key = 'c',
    mods = 'CTRL',
    action = wezterm.action_callback(function(window, pane)
      local has_selection = window:get_selection_text_for_pane(pane) ~= ''
      if has_selection then
        window:perform_action(act.CopyTo 'ClipboardAndPrimarySelection', pane)

        window:perform_action(act.ClearSelection, pane)
      else
        window:perform_action(act.SendKey { key = 'c', mods = 'CTRL' }, pane)
      end
    end),
  },
  {
    key = 'v',
    mods = 'CTRL',
    action = act.PasteFrom 'Clipboard',
  },
}


return config
