# dotfiles

Personal dotfiles for macOS, managed with symlinks.

## Quick Start

```sh
git clone git@github.com:lucataco/dotfiles.git ~/Code/dotfiles
cd ~/Code/dotfiles
./install.sh
```

The install script will:
- Symlink dotfiles to `~` (backs up existing files as `*.backup`)
- Install [Homebrew](https://brew.sh) if missing
- Install all packages from the [Brewfile](Brewfile)
- Install [Oh My Zsh](https://ohmyz.sh/) if missing
- Install VS Code extensions

## What's Included

| File | Description |
|------|-------------|
| `.zshrc` | Zsh config — Oh My Zsh, aliases, NVM (lazy-loaded), conda, fzf, thefuck |
| `.zprofile` | Login shell — Homebrew & PATH setup |
| `.gitconfig` | Git config — delta pager, SSH signing, 30+ aliases, color settings |
| `.tmux.conf` | tmux — mouse, 256-color, vi mode, sensible defaults |
| `.nanorc` | nano — syntax highlighting, tabs-to-spaces (optional) |
| `Brewfile` | Homebrew packages — CLI tools, casks, VS Code extensions |
| `vscode/` | VS Code settings and extensions list |

## Key Tools

- **Shell:** zsh + [Oh My Zsh](https://ohmyz.sh/) (robbyrussell theme)
- **Editor:** [Neovim](https://neovim.io/)
- **Git pager:** [delta](https://github.com/dandavid/delta) (side-by-side diffs)
- **Modern CLI:** [eza](https://eza.rocks/) (ls), [bat](https://github.com/sharkdp/bat) (cat), [ripgrep](https://github.com/BurntSushi/ripgrep) (grep), [fd](https://github.com/sharkdp/fd) (find), [btop](https://github.com/aristocratos/btop) (top), [fzf](https://github.com/junegunn/fzf) (fuzzy finder)
- **Utilities:** [thefuck](https://github.com/nvbn/thefuck) (typo correction), [htop](https://htop.dev/), [tmux](https://github.com/tmux/tmux)

## Updating

After changing dotfiles on your machine, sync back to the repo:

```sh
cd ~/Code/dotfiles
cp ~/.zshrc ~/.zprofile ~/.gitconfig .
brew bundle dump --force --file=Brewfile
code --list-extensions > vscode/extensions.txt
git add -A && git commit -m "Update dotfiles"
git push
```
