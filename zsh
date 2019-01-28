# zsh
# global zsh configuration

source ~/.dotfiles/shell.sh

# ---------------- #
# General settings #
# ---------------- #

# Enable
autoload -Uz compinit && compinit

# Keybinds
export KEYTIMEOUT=1
bindkey -v

function zle-keymap-select {
  case $KEYMAP in
    (main)
      ZLE_MODE="insert" ;;
    (vicmd)
      ZLE_MODE="normal" ;;
    (*)
      echo "Unknown keymap: " $KEYMAP
  esac
  zle reset-prompt
}

zle -N zle-keymap-select

# Prompt
setopt prompt_subst
source ~/.dotfiles/zsh_prompt.zsh-theme

# ------- #
# Plugins #
# ------- #

source ~/.dotfiles/res/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.dotfiles/res/zsh-plugins/git-flow-completion/git-flow-completion.zsh
