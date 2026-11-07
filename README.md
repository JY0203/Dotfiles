# dotfiles

My macOS terminal setup: **Ghostty + tmux + Neovim**, with a minimal "cream on black" theme and a translucent, blurred window.

## What's inside

| Path | Description |
|---|---|
| `ghostty/` | Ghostty config: transparent + blurred window, cream-black palette, JetBrainsMono Nerd Font |
| `tmux/tmux.conf` | tmux config: transparent status bar, rounded pill tabs, prefix-based shortcuts, dimmed inactive panes, vi copy mode |
| `nvim/` | Hand-written Lua config (no distro) using `vim.pack`, with a custom `cream-black` colorscheme (`nvim/colors/cream-black.lua`) |

## Theme

| Role | Color |
|---|---|
| Background | `#0d0d0d` |
| Foreground (cream) | `#e6dfc8` |
| Comment / dim | `#6b675c` |
| Red / Orange / Yellow | `#d9776b` / `#d9a066` / `#e0c98a` |
| Green / Cyan / Blue / Purple | `#a3b18a` / `#8bb5ad` / `#8fa8b8` / `#b89bb5` |

Neovim backgrounds are set to `NONE` so the Ghostty transparency shows through all three tools consistently.

## Neovim

- Requires Neovim 0.12+ (uses the built-in `vim.pack` plugin manager).
- Plugin versions are pinned in `nvim/nvim-pack-lock.json`; update with `:lua vim.pack.update()`.
- Rule: native vi keys are never remapped; custom keys live under `<leader>` (Space).

| Keys | Action |
|---|---|
| `<leader>ff` / `fg` / `fb` / `fr` / `fh` / `fd` / `fs` | Find files / grep / buffers / resume / help / diagnostics / symbols |
| `<leader>e` | File explorer (oil) |
| `gd`, `grr`, `gri`, `K`, `]d` / `[d` | LSP definition / references / implementation / hover / diagnostics |
| `<leader>ca` / `cr` / `cf` | Code action / rename / format |
| `]c` / `[c`, `<leader>gp` / `gs` / `gS` / `gr` / `gb` / `gB` / `gd` | Git hunks: navigate / preview / stage / stage buffer / reset / blame / blame buffer / diff |
| `<leader>p` / `<leader>d` | Paste last yank / delete without yanking |

## tmux shortcuts

Prefix: `Ctrl+t` (press twice to send `Ctrl+t` to the app). Pane movement mirrors Neovim's `Ctrl+w h/j/k/l`.

| Keys | Action |
|---|---|
| `prefix v` / `prefix s` | Split side by side / stacked (opens in current dir, evens out panes at the same level) |
| `prefix %` / `prefix "` | tmux default splits, kept as-is |
| `prefix h/j/k/l` | Move between panes |
| `prefix H/J/K/L` | Resize pane (repeatable) |
| `prefix c` | New window in current dir |
| `prefix 1..9` | Select window |
| `prefix x` / `prefix e` | Kill pane (confirms) / kill all other panes |
| `prefix z` | Zoom pane |
| `prefix w` | Pick session / window from a tree |
| `prefix g` | lazygit in a popup |
| `prefix [` | Copy mode: `v` select, `y` copy to clipboard |
| `prefix r` | Reload config |

## Install

Prerequisites:

```bash
brew install neovim tmux ripgrep fd fzf lazygit node python tree-sitter-cli
brew install --cask ghostty font-jetbrains-mono-nerd-font
```

Then:

```bash
git clone https://github.com/JY0203/Dotfiles.git ~/dotfiles
cd ~/dotfiles

# move any existing configs out of the way first, otherwise the symlinks end up inside them
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null
mv ~/.config/tmux ~/.config/tmux.bak 2>/dev/null
mv ~/.config/ghostty ~/.config/ghostty.bak 2>/dev/null

for d in ghostty nvim tmux; do ln -sfn ~/dotfiles/$d ~/.config/$d; done
```

On first launch, Neovim asks to install plugins (`vim.pack`), then Mason installs the language servers and treesitter compiles parsers in the background. Restart Neovim once they finish.
