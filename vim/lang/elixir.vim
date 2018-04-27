setlocal spelllang=en_us   " Use US English when we want to spellcheck comments
setlocal formatprg=mix\ format\ -

let g:mix_format_on_save = 1 " Use the mix formatter when saving
let g:mix_format_silent_errors = 1
let g:mix_format_options = '--check-equivalent'

" -------- "
" Keybinds "
" -------- "

map <LocalLeader>r :terminal iex<CR>
map <LocalLeader>s :terminal iex -S mix<CR>

map <LocalLeader>t :terminal ++rows=20 mix test<CR>
