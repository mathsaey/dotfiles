# This file contains exports and functions that should be available in
# all shells.

# ------- #
# Exports #
# ------- #

# There is only one true editor
export EDITOR="vim"

# I don't like homebrew analytics
export HOMEBREW_NO_ANALYTICS=1

# Use ~/.bin for custom scripts
export PATH=~/.bin:$PATH

# Use ripgrep as the default fzf search provider
export FZF_DEFAULT_COMMAND="rg --files"

# -------- #
# Commands #
# -------- #

function smux {
  # Attach to a tmuxinator session (arg 2) for user (arg 3) on a server (arg 1).
  # - if no server is provided, connect to brethil
  # - if no session name is provided use the current username
  # - if no user name is provided use the current username
  srv=${1-brethil}
  ses=${2-$USER}
  usr=${3-$USER}
  ssh $usr@$srv -t tmuxinator $ses
}

function highlight-snippet {
  theme=${2-seashell}
  fontsize=${3-12}
  # Highlight the current contents of the clipboard
  pbpaste | highlight -O rtf -S $1 -s $theme -K $fontsize -k menlo --no-trailing-nl | pbcopy
}
