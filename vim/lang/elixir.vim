setlocal spelllang=en_uk   " Use uk English when we want to spellcheck comments
setlocal textwidth=80      " Wrap at 80 charachters
setlocal formatprg=mix\ format\ -

" MixFormat set up
let g:mix_format_silent_errors = 1
let g:mix_format_options = '--check-equivalent'

" Disable ale for elixir for now due to two main issues:
" - mix recompiles projects when a mix task does not exist (e.g. when credo is
"   not a dependency for a specific project), this messes up phoenix auto
"   reload.
" - One of the linters seems to go a bit crazy, up to the point that the whole
"   system can become unusable.
let b:ale_linters = []

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

map <LocalLeader>s :terminal ++close iex -S mix<CR>
map <LocalLeader>S :terminal ++close iex<CR>

map <LocalLeader>t :terminal ++noclose ++rows=20 mix test<CR>

