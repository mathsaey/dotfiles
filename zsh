# .zshrc
# Mathijs Saey

# --------- #
# Oh-My-Zsh #
# --------- #

export ZSH=$HOME/.oh-my-zsh

# Plugins
plugins=(osx vundle powerlevel9k zsh-syntax-highlighting)

# Visuals
ZSH_THEME="powerlevel9k/powerlevel9k"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs root_indicator)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs time)
POWERLEVEL9K_DISABLE_RPROMPT=true

POWERLEVEL9K_HOME_ICON=''
POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_FOLDER_ICON=''

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="\e[0;31m$\e[0m "

POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND="white"
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND="black"
POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND="red"
POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND="black"

source $ZSH/oh-my-zsh.sh

# --------- #
# Variables #
# --------- #

export EDITOR="vim"
export VISUAL="mvim"

alias vim=mvim

export PATH=$PATH:~/.bin

# ----------------- #
# Commands at Login #
# ----------------- #

screenfetch
