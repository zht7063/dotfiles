# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Prompt is managed by Starship.
ZSH_THEME=""

plugins=(git)

source "$ZSH/oh-my-zsh.sh"

# PATH
export PATH="$HOME/.local/bin:$PATH"

# Starship prompt
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

# EasyTier 按需组网（macOS 最小安装）
et() {
  sudo "$HOME/.local/bin/easytier-core" -c "$HOME/.config/easytier/config.toml"
}

# Aliases
alias ezaa='eza -T -L 2'

# Machine-local secrets and overrides (not tracked in git)
[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"
