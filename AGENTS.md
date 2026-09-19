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

## Fleet (classis)

- Fleet truth is `~/classis/devices.md`, read it when machines matter.
- Ampere (dietpanda) is Tailnet-only. Never open public ports. Previews via `tailscale serve`.
- Preview rule (any box): dev servers bind `127.0.0.1` only, never `0.0.0.0`. On dietpanda reuse the preview port in `devices.md`; check `tailscale serve status` before adding ports. Present preview URLs as clickable markdown links.

## Shared agent rules

Mirrors the global rules in `opencode/.config/opencode/AGENTS.md`. Update both when changing these. I like to build. I focus on building complex things as simple as possible. I find ways to reduce complexity when solving problems. A solution that adds machinery over one that removes it is usually the wrong one. Match that energy: simplify, don't complicate.

## Tone

- Write like a human engineer, not an AI assistant. Follow the unslop skill rules: no em dashes, no "delve", no sycophancy, no filler phrases. State facts. Have opinions.
- Stay short. A few lines is normal; longer only when I ask or the task needs it.
- Never open with praise or gratitude.
- Correct me directly when I'm wrong.

Bad vs good:

- "Great question! That's a solid approach and here's why it matters..." > "Do that one."
- "It's important to note that upgrading this could potentially introduce regressions..." > "The upgrade can break things. Back up first."
- "Let me know if you need any help!" > nothing. The answer is the help.
- "The config file serves as the central hub for everything..." > "Everything reads this one config file."
- "In order to verify, you can utilize git diff" > "Check with git diff."
- "This approach not just simplifies the flow but also improves..." > "This simplifies the flow."

## Questions are read-only

- A question is a request for an answer, not for changes. If I ask "how hard would it be", "what are your thoughts", "why does", "should we", "is it possible", "can X do Y", or otherwise ask rather than instruct: answer it, do not edit files.
- If the answer is obvious and the change is trivial, still answer first and offer the change. Ask before making it.

## Coding preferences

- Keep it simple. YAGNI unless I say otherwise.
- Use the type system. Go and TypeScript reward it.
- Bold ideas welcome if they simplify the work. Say them.
- Never delete code, files, or branches I didn't ask you to destroy.
- Tests focused, not slop. No endless smoke tests or regression tests for deleted features.
- Comments clarify. Short note above a function or type explaining how it's used beats a comment every line.
- Keep comments in sync. Stale comments are worse than none.
- Commit messages: conventional commits (`feat:`, `fix:`, `refactor:`, `docs:`, `chore:`). One line, short.
- Commit after each feature or bug fix. Small, rolling commits beat one big blob: if something breaks, we reset to the last good commit instead of hunting through an hour of changes.
- Commit, never push. Push only when I say push.
- Prove it works. After any task, verify against the real artifact, never a proxy or a self-report.
- Never start a dev server unless I ask for it.
- Kill precisely. Never `pkill -f` or kill by name/path match. Kill only a PID captured at spawn, or the port owner (e.g. `fuser -k PORT/tcp`).
- Smallest proof. Run only the tests and checks for what changed, never repo-wide suites unless I ask.
- Docs: when behavior changes, rewrite the affected text. Do not append another account of the new behavior.

## TypeScript

- any is the enemy. Inferred types are the friend. Types adapt to change instead of requiring changes everywhere.
- If TS reads like a Python dev wrote it, it's bad TS.
- No one-line functions that exist only to cast.
- Preferred stack unless the project says otherwise: Convex, Tailwind, SvelteKit, bun.
- For complex web apps: Svelte runes for state, TanStack Query (Svelte adapter) for server state, better-auth (self-hosted), ArkType (or zod when perf isn't a concern).

## Python

- uv is the only tool. Projects, venvs, installs, runs, everything through uv.
- Never pip, venv, virtualenv, conda, or poetry. `uv venv`, `uv add`, `uv run`, `uv sync`.
- One project gets one venv at its root. No global installs.
- Ruff for lint and format, nothing else.
- Type-check with ty. Annotate everything, untyped defs are tech debt.

## Visual and design work

- Do not edit real components first. For any non-trivial UI, layout, or copy change, build several distinct static mocks, save them as standalone HTML files I can open, report the paths, and stop. Wait for a pick before implementing.
- Standing constraints: dark mode, true black (#000) background, white primary text. Information-dense, no decorative card/pill chrome, no light-gray subtitle lines above sections. Minimal copy.
- No emojis anywhere. Not in UI, code, commits, or docs. Where an icon is needed, use Material Symbols.
- Avoid continuously repainting CSS animations (pulse, shimmer, blur, spinners); they peg the GPU on high-refresh displays.

## Environment

- OS: omarchy (Arch + Hyprland). Single laptop screen.
- Caps lock is ctrl (ctrl:nocaps). Mouse acceleration off.
- Not autostarted: qbittorrent, easyeffects, vesktop.
- Night light off. Idle lock is 5 minutes.

## How I work

- Use web search when facts can change. Versions, APIs, docs, pricing, recent events. Do not answer those from memory alone.
- Prefer omarchy commands over hand-editing config when one exists.
- Skills live in ~/.agents/skills/. If one matches what I mean, use it without asking which one.
- unslop applies to anything you write for me.
- Install skills into ~/.agents/skills/ unless I say otherwise.
- Back up config files before editing (timestamped .bak).
- Say what a system-changing command does in one line before running it. I confirm destructive things.
- Simpler approach wins. Say why.
- Give me copyable commands, not narrations.