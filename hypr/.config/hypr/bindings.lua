-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- Close the focused window (alternative to SUPER+W).
o.bind("SUPER + Q", "Close window", hl.dsp.window.close())

-- Apps launcher (alternative to SUPER+ALT+SPACE).
o.bind("SUPER + A", "Apps menu", "omarchy-menu toggle apps")

-- Unbind unused omarchy preinstalled app/webapp binds (Tmux, Herdr, Spotify,
-- cliamp, lazydocker stay). Keys are freed for future personal bindings.
local removed_preinstalled = {
  "SUPER + SHIFT + G",      -- Signal
  "SUPER + SHIFT + O",      -- Obsidian
  "SUPER + SHIFT + W",      -- Omawrite
  "SUPER + SHIFT + SLASH",  -- 1Password
  "SUPER + SHIFT + A",      -- ChatGPT
  "SUPER + SHIFT + ALT + A", -- Grok
  "SUPER + SHIFT + C",      -- HEY Calendar
  "SUPER + SHIFT + E",      -- HEY Email
  "SUPER + SHIFT + ALT + E", -- HEY new email
  "SUPER + SHIFT + Y",      -- YouTube
  "SUPER + SHIFT + ALT + G", -- WhatsApp
  "SUPER + SHIFT + CTRL + G", -- Google Messages
  "SUPER + SHIFT + P",      -- Google Photos
  "SUPER + SHIFT + S",      -- Google Maps
  "SUPER + SHIFT + X",      -- X
  "SUPER + SHIFT + ALT + X", -- X compose
}
for _, keys in ipairs(removed_preinstalled) do
  hl.unbind(keys)
end