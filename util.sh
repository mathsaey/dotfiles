function smux {
  # Attach to a tmux session with name $USER over ssh
  ssh $1 -t tmux attach -t $USER
}

function highlight-snippet {
  # Highlight the current contents of the clipboard
  pbpaste | highlight -O rtf -S $1 -s seashell -K 12 -k menlo --no-trailing-nl | pbcopy
}
