setlocal spell                 " Turn on spelling when writing tex
setlocal spelllang=en_us       " Use US English spelling by default

setlocal colorcolumn=""
setlocal breakindent
setlocal linebreak
setlocal wrap

let g:tex_conceal = 'abdmg'
let g:tex_flavor = 'latex'

nnoremap <LocalLeader>bo  :call OpenCiteKeyPdf(expand("<cword>"))<CR>
