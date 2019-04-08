setlocal spell                 " Turn on spelling when writing tex
setlocal spelllang=en_us       " Use US English spelling by default

setlocal textwidth=80          " Wrap at 80 characters
setlocal linebreak             " Turn on line wrapping

let g:tex_conceal = 'abdmgs'
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'skim'
let g:vimtex_latexmk_continuous = 1
