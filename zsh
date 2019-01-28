# zsh
# global zsh configuration

source ~/.dotfiles/shell.sh

# ---------------- #
# General settings #
# ---------------- #

# Enable
autoload -Uz compinit && compinit

# ------ #
# Prompt #
# ------ #

source ~/.dotfiles/zsh_prompt.zsh-theme

setopt prompt_subst
PROMPT='$(host) $(current_dir) $(prompt)'
RPROMPT='$(bg_jobs) $(git_status)'

# ------- #
# Plugins #
# ------- #

source ~/.dotfiles/res/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.dotfiles/res/zsh-plugins/git-flow-completion/git-flow-completion.zsh
