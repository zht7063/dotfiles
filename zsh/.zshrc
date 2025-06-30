# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="simple"

plugins=(git sudo z)

source $ZSH/oh-my-zsh.sh

# Path to Neovim
export PATH="$PATH:/opt/nvim/"

# 配置别名
alias cls="clear"
alias tl="tmux ls"
alias t="tmux a"

