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
  # Highlight the current contents of the clipboard
  pbpaste | highlight -O rtf -S $1 -s seashell -K 12 -k menlo --no-trailing-nl | pbcopy
}
