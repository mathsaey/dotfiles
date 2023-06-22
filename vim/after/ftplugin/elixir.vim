" Spell set up
setlocal spell             " The elixir syntax file marks spell regions, so always turn this on
setlocal spelllang=en_gb   " Use uk English when we want to spellcheck comments

" Formatting set up
setlocal textwidth=98      " Wrap at 98 charachters, based on default formatting parameters
setlocal colorcolumn=98    " Highlight wrap line

if has('nvim')
  " Tell gutentags that a project is an elixir project if a mix.exs file is present
  call add(g:gutentags_project_info, {'type': 'elixir', 'file': 'mix.exs'})
endif

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

inoreabbrev <buffer> pp \|>

" -------- "
" Keybinds "
" -------- "

nnoremap <LocalLeader>d :silent !mix docs<CR>
nnoremap <LocalLeader>D :silent !open doc/index.html<CR>

nnoremap <LocalLeader>s :call OpenTerminal('iex -S mix')<CR>
nnoremap <LocalLeader>S :call OpenTerminal('iex')<CR>
