" -------- "
" Settings "
" -------- "

setlocal makeprg=python\ %
setlocal spelllang=en_us   " Use US English when we want to spellcheck comments

let g:syntastic_python_checkers=['python', 'pylint', 'pyflakes']

" -------- "
" Keybinds "
" -------- "

map <LocalLeader>r :ConqueTerm python<CR>
map <LocalLeader>b :ConqueTerm python -i "%"<CR>

map <LocalLeader>r3  :ConqueTerm python3<CR>
map <LocalLeader>b3  :ConqueTerm python3 -i "%"<CR>
