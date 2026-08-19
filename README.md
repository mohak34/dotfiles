# dotfiles

Personal setup for Omarchy. One command chain that removes unwanted preinstalls, installs your apps, and stows all dotfiles.

## Setup on a new machine

```bash
git clone git@github.com:mohak34/dotfiles.git ~/dotfiles
cd ~/dotfiles
./scripts/setup-apps.sh
```

That's it. The chain (answer the `gum` prompts with y):

1. **apps-remove.sh** — removes unneeded preinstalled apps + all webapp launchers
2. **apps-repo.sh** — installs stow, qbittorrent, EasyEffects
3. **apps-aur.sh** — installs Zen, Vesktop, Helium, Bibata cursors (AUR)
4. **stow-dotfiles.sh** — fetches the nvim submodule, stows ghostty + hypr + nvim configs
5. **cursor-gtk.sh** — sets the Bibata Ice cursor for GTK apps

## What gets stowed

| Package | Contents |
|---|---|
| `ghostty/` | terminal config (theme, scroll speed, font) |
| `hypr/` | window gaps/borders, keybinds, monitor scale, cursor theme |
| `nvim/` | nvim config (submodule → github.com/mohak34/nvim) |

Each script can also be run on its own:

```bash
./scripts/stow-dotfiles.sh     # just re-stow everything
./scripts/cursor-gtk.sh        # just fix the GTK cursor
```
