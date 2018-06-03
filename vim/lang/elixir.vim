setlocal spelllang=en_uk   " Use uk English when we want to spellcheck comments
setlocal formatprg=mix\ format\ -

let g:mix_format_silent_errors = 1
let g:mix_format_options = '--check-equivalent'

" Match standard parens in elixir, also match do ... end and the like
" We don't support with ... do and for ... do, as this seems to mess up the
" matching
let g:rainbow_conf.separately.elixir = {
      \ 'parentheses': [
      \   'start=;(; end=;); fold',
      \   'start=;\[; end=;\]; fold',
      \   'start=;{; end=;}; fold',
      \
      \   'start=;\(\s\|^\)\(do\|fn\)\(\s\|$\); ' .
      \   'step=;\(\s\|^\)\(->\|catch\|rescue\|after\|else\)\(\s\|$\); ' .
      \   'end=;\(\s\|^\)end; ' .
      \   'fold'
      \ ]}

" -------- "
" Keybinds "
" -------- "

map <LocalLeader>s :terminal iex -S mix<CR>
map <LocalLeader>S :terminal iex<CR>

map <LocalLeader>t :terminal ++rows=20 mix test<CR>

