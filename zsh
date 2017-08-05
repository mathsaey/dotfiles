# zsh
# global zsh configuration

export HOMEBREW_NO_ANALYTICS=1
source ~/.dotfiles/util.sh

# ------- #
# Visuals #
# ------- #

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

source ~/.dotfiles/res/zsh-plugins/powerlevel9k/powerlevel9k.zsh-theme

# ------- #
# Plugins #
# ------- #

source ~/.dotfiles/res/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
