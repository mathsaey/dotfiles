function smux {
  # Attach to a tmuxinator session with name $USER over ssh
  ssh $1 -t tmuxinator $USER
}

function imux {
  # Attach to a tmuxinator session with name $USER over ssh
  # The session should have already started.
  ssh $1 -t tmux -CC attach -t $USER
}

function highlight-snippet {
  # Highlight the current contents of the clipboard
  pbpaste | highlight -O rtf -S $1 -s seashell -K 12 -k menlo --no-trailing-nl | pbcopy
}
