" Spell set up
setlocal spell             " The elixir syntax file marks spell regions, so always turn this on
setlocal spelllang=en_gb   " Use uk English when we want to spellcheck comments

" Formatting set up
setlocal textwidth=80      " Wrap at 80 charachters
setlocal formatprg=mix\ format\ -

" MixFormat set up
let g:mix_format_silent_errors = 1
let g:mix_format_options = '--check-equivalent'

" Tell gutentags that a project is an elixir project if a mix.exs file is present
call add(g:gutentags_project_info, {'type': 'elixir', 'file': 'mix.exs'})

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

" I find it awkward to type the pipe charachter.
iabbrev <buffer> pp \|>

" -------- "
" Keybinds "
" -------- "

map <LocalLeader>s :terminal ++close iex -S mix<CR>
map <LocalLeader>S :terminal ++close iex<CR>

map <LocalLeader>t :terminal ++noclose ++rows=20 mix test<CR>

