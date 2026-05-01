# 📂 Migration & Merging Guide

Use this guide to safely move these dotfiles to your Work PC without losing existing custom configurations.

## 1. The "Safety First" Approach (Conflict Detection)

Before activating anything, check where your Work PC's current config conflicts with this repo.

1. Clone the repo: `git clone <your-repo-url> ~/.dotfiles`
2. Run a simulation:

    ```bash
    cd ~/.dotfiles
    stow --simulate *
    ```

3. **Stow will list every conflict.** It will say "existing target is not a symlink" for files that already exist on your Work PC.

---

## 2. Merging Existing Configs (The Diff Phase)

For every conflicting file, compare them to see what you want to keep:

```bash
# Example: Compare your work Zsh config with the repo version
nvim -d ~/.zshrc ~/.dotfiles/zsh/.zshrc
```

- **Left Side:** Your current Work PC config.
- **Right Side:** This repo's config.

---

## 3. The "Include" Pattern (Recommended)

To keep your Work PC settings clean and separate from the global repo, use the "Local Override" pattern.

### For Shell (Zsh/Bash)

1. Move your Work-specific aliases/exports to a new file: `~/.zshrc.local`
2. In the repo's `zsh/.zshrc`, ensure this line exists at the bottom:

    ```bash
    [[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
    ```

### For Sway

1. Move Work-specific monitor layouts or rules to: `~/.config/sway/config.d/work.conf`
2. In the repo's `sway/.config/sway/config`, add this at the bottom:

    ```sway
    include ~/.config/sway/config.d/*
    ```

---

## 4. Final Activation

Once you've moved your custom Work settings into `.local` or `include` files:

1. **Backup** the original files on the Work PC (just in case):

    ```bash
    mv ~/.zshrc ~/.zshrc.bak
    mv ~/.config/sway ~/.config/sway.bak
    ```

2. **Stow** the new configs:

    ```bash
    cd ~/.dotfiles
    stow *
    ```

3. **Restore** your local overrides if needed, and reload!
