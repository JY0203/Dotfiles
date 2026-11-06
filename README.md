# dotfiles

My macOS terminal setup: **Ghostty + tmux + Neovim**, with a minimal "cream on black" theme and a translucent, blurred window.

## What's inside

| Path | Description |
|---|---|
| `ghostty/` | Ghostty config: transparent + blurred window, cream-black palette, JetBrainsMono Nerd Font |
| `tmux/tmux.conf` | tmux config: transparent status bar, rounded pill tabs, `Alt`-based shortcuts, vi copy mode |
| `nvim/` | Hand-written Lua config (no distro) using `vim.pack`, with a custom `cream-black` colorscheme (`nvim/colors/cream-black.lua`) |
| `install.sh` | Symlinks the folders above into `~/.config/` |

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

- Prefix: `Ctrl+s`
- `Alt+v` / `Alt+s`: split horizontally / vertically
- `Alt+t`: new window, `Alt+w`: kill pane, `Alt+1..4`: select window
- `Alt+h/j/k/l`: move between panes
- `Alt+r`: reload config

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

./install.sh
```

On first launch, Neovim asks to install plugins (`vim.pack`), then Mason installs the language servers and treesitter compiles parsers in the background. Restart Neovim once they finish.
