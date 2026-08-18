-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- Close the focused window (alternative to SUPER+W).
o.bind("SUPER + Q", "Close window", hl.dsp.window.close())

-- Apps launcher (alternative to SUPER+ALT+SPACE).
o.bind("SUPER + A", "Apps menu", "omarchy-menu toggle apps")