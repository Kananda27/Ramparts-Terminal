local wezterm = require 'wezterm'
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- ==========================================
-- SHELL & FONT
-- ==========================================
config.default_prog = { 'pwsh.exe', '-NoLogo' }
config.font = wezterm.font('GohuFont 11 Nerd Font Mono')
config.font_size = 11.0

-- ==========================================
-- VISUAL (PADDING + OPACITY)
-- ==========================================
config.color_scheme = 'Tokyo Night'
config.window_background_opacity = 1
config.window_decorations = "RESIZE"
-- Padding digedein dikit biar kerasa bedanya
config.window_padding = {
  left = '10px',
  right = '10px',
  top = '10px',
  bottom = '10px',
}

-- ==========================================
-- STATUS BAR (FORCE SHOW)
-- ==========================================
wezterm.on('update-right-status', function(window, pane)
  window:set_right_status(wezterm.format({
    { Foreground = { Color = '#7aa2f7' } }, -- Warna biru Tokyo Night
    { Text = ' default | ramparts ' },
  }))
end)

-- ==========================================
-- KEYBINDINGS
-- ==========================================
config.keys = {
  { key = '|', mods = 'CTRL|SHIFT', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = '_', mods = 'CTRL|SHIFT', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },
  { key = 'w', mods = 'CTRL|SHIFT', action = wezterm.action.CloseCurrentPane { confirm = true } },
}

return config