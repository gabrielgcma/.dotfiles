# Workflow Quick Guide

## 1. Environment Isolation (`direnv`)

Automatically activates Python venvs and environment variables when you `cd` into a directory.

### Auto-activating Python Venv

In any project with a `.venv` folder:

```bash
echo "layout python-venv" > .envrc
direnv allow
```

- **Activation:** Occurs immediately when entering the folder.
- **Deactivation:** Occurs automatically when you `cd` out.

---

## 2. Clipboard History (`cliphist`)

Remembers everything you copy (text and images).

- **Open History:** Press **`$mod + c`** (Super + C).
- **Search:** Type in the Rofi menu to filter.
- **Select:** Press **Enter** to put it back in your clipboard.
- **Paste:** Use **`Ctrl + v`** normally.

---

## 3. Dotfile Management (`GNU Stow`)

Makes your config modular and easy to move to your work PC.

- **Structure:** Files live in `~/.dotfiles/<package>/`.
- **Add New Config:** Move a file into a package folder and run `stow <package_name>`.
- **Deploy to New PC:**

  ```bash
  cd ~/.dotfiles
  # Use */ to stow only directories (packages)
  stow */
  ```

  *Note: If you want to exclude specific directories like `system-configs` (which is handled by `deploy-sys.sh`), you can use:*
  `stow --ignore=system-configs */`

---

## 4. Productivity Aliases

- `gs` / `ga` / `gc` / `gp`: Git status, add, commit, and push.
- `lg`: Open `lazygit`.
- `z <dir>`: Smart jump to any directory you've visited before.
- `update`: Run a full system update.
- `sysclean`: Deep clean package cache and orphans.
