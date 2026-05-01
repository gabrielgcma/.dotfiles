A curated list of essential binaries and tools for a high-performance, open-source engineering workflow using Tiling Window Managers.

## 🛠 Core CLI Power Tools

Modern, fast replacements for legacy Unix utilities.

| Tool               | Purpose                                                  | Modern Alternative to... |
| :----------------- | :------------------------------------------------------- | :----------------------- |
| **`ripgrep` (rg)** | Ultra-fast recursive search                              | `grep`                   |
| **`fd`**           | Simple, fast, and user-friendly find                     | `find`                   |
| **`bat`**          | A cat clone with syntax highlighting and git integration | `cat`                    |
| **`eza`**          | A modern, feature-rich replacement for ls                | `ls`                     |
| **`delta`**        | A syntax-highlighting pager for git/diff                 | Default git diff         |
| **`fzf`**          | Command-line fuzzy finder                                | —                        |
| **`zoxide`**       | A smarter cd command that learns your habits             | `cd`                     |
| **`jq` / `yq`**    | Command-line JSON/YAML processors                        | —                        |
| **`btop`**         | Resource monitor that shows usage and stats              | `top` / `htop`           |

## 💻 Development & Engineering

Tools that define the "Developer Experience" (DX).

- **Editor:** `neovim` (specifically **LazyVim** for a pre-configured, IDE-like experience).
- **Git TUI:** `lazygit` — Easily the best way to manage commits, branches, and stashes.
- **GitHub CLI:** `gh` — Manage PRs, issues, and releases from the terminal.
- **Multiplexer:** `zellij` — A modern, user-friendly alternative to `tmux`.
- **Terminal:** `kitty` — GPU-accelerated with excellent font and image support.
- **Shell:** `zsh` + `Powerlevel10k` (for context-aware prompts like git branch, python venv).
- **Runtimes:** `nvm` (Node), `pyenv` (Python), `rustup` (Rust), `go`.

## 🪟 Tiling WM Infrastructure (The "Glue")

Essential utilities to make a bare-bones WM feel like a complete Desktop Environment.

- **Launcher/Menu:** `rofi` (X11) or `wofi` (Wayland).
- **Notifications:** `dunst` (X11) or `mako` (Wayland).
- **Clipboard:** `cliphist` (Wayland) or `greenclip` (X11) + `fzf` integration.
- **Status Bar:** `polybar` (X11) or `waybar` (Wayland).
- **Screen Locking:** `swaylock-effects` or `hyprlock`.
- **Idle Management:** `swayidle` or `hypridle`.
- **Screenshot:** `grim` + `slurp` (Wayland) or `maim` (X11).

## 🔒 Security & Secrets

- **`seahorse`**: GUI for managing GNOME Keyring and GPG keys.
- **`gnome-keyring`**: The backend service for storing secrets.
- **`bitwarden-cli` (bw)**: Access your vault directly from the CLI.
- **`sops`**: For encrypting configuration files in git repos.

## 📦 Recommended Installation (Arch/Paru)

```bash
paru -S ripgrep fd bat eza git-delta fzf zoxide jq yq btop \
        neovim lazygit github-cli zellij kitty \
        seahorse gnome-keyring \
        direnv pyenv nvm-git
```
