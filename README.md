# dotfiles

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Included Packages

- `nvim` (`~/.config/nvim`)
- `ghostty` (`~/.config/ghostty`)
- `zsh` (`~/.zshrc`, `~/.zprofile`, `~/.zshenv`)
- `starship` (`~/.config/starship.toml`)
- `fastfetch` (`~/.config/fastfetch`)
- `yazi` (`~/.config/yazi`)

## Usage

### Initial setup on a new machine

```bash
git clone https://github.com/zht7063/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

### Manage individual packages

```bash
# Link a package
stow -v nvim

# Unlink a package
stow -D -v nvim
```
