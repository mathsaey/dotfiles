function smux {
  ssh $1 -t mux $USER
}

function highlight-snippet {
  pbpaste | highlight -O rtf -S $1 -s seashell -K 12 -k menlo --no-trailing-nl | pbcopy
}
