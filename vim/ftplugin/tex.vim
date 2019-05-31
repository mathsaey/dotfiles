setlocal spell                 " Turn on spelling when writing tex
setlocal spelllang=en_us       " Use US English spelling by default

setlocal colorcolumn=""
setlocal breakindent
setlocal linebreak
setlocal wrap

let g:tex_conceal = 'abdmgs'
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'skim'
let g:vimtex_latexmk_continuous = 1

nnoremap <LocalLeader>bo  :call OpenCiteKeyPdf(expand("<cword>"))<CR>
