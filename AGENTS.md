# Dotfiles - Strix

Personal omarchy config, stowed into the home directory. This is my real working setup, not a distribution. Keep it truthful to the live machine.

## Structure

- Each top-level dir is a stow package mapping into `~/.config/` (e.g. `hypr/.config/hypr/` -> `~/.config/hypr/`).
- `nvim/` is a git submodule (own repo, `mohak34/nvim`). Never edit its contents in this repo; work happens in that repo.
- `scripts/` is the machine-setup chain. `wallpapers/` and `scripts/` are not stowed (excluded in `stow-dotfiles.sh`).
- `stow-dotfiles.sh` also runs `git submodule update --init --recursive` first. Submodules are part of the deploy.

## How a new machine gets set up

1. Clone this repo to `~/dotfiles`.
2. Run `./scripts/setup-apps.sh`.
3. It chains: `apps-remove.sh` -> `apps-repo.sh` -> `apps-aur.sh` -> `stow-dotfiles.sh` -> `cursor-gtk.sh`.

Each script asks with `gum confirm` before doing anything. Never change that: this is a machine-safety gate.

## Script conventions

- Every script has an `omarchy:summary=` header comment. Keep it accurate, omarchy surfaces it.
- Package lists live as arrays at the top of each `apps-*.sh`. Editing a package = editing the array, not the install logic.
- `apps-remove.sh` removes all web-app launchers via `omarchy-webapp-remove-all` and drops unused packages. It runs first so installs never fight removals.
- `cursor-gtk.sh` is idempotent and machine-local (gsettings), safe to rerun. It exists because GTK cursor is machine state, not config. Keep that split: config in stow, machine state in scripts.
- Use `omarchy pkg add` / `omarchy pkg aur add` / `omarchy pkg drop` for package ops. Never plain pacman.

## Hyprland rules

- Personal files: `input.lua`, `looknfeel.lua`, `bindings.lua`, `monitors.lua`, `autostart.lua`. `hyprland.lua` loads omarchy defaults then these.
- Desktop is compact on purpose: gaps 0, border 1, flat accel, capslock as ctrl. Don't "improve" this without being asked.
- New keybindings go in `bindings.lua` with `o.bind`. Check `omarchy menu keybindings --print` before adding; don't shadow existing binds.
- After changing hypr configs, validate with `hyprctl reload` and check `hyprctl configerrors`.
- Never touch `/usr/share/omarchy/`. Read it freely, edit nothing. Updates overwrite it.

## Keeping the repo truthful

- Config changed live in `~/.config/` but not stowed here = drift. Mirror changes back into the package tree.
- If a config move or rename breaks the live machine, fix the repo too. The live machine is the source of truth, the repo is its backup and its clone recipe.
- Commit messages: conventional commits (`feat:`, `fix:`, `refactor:`, `docs:`).
- Test scripts with `bash -n` before committing.