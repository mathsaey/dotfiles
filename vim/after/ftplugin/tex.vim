" Use us spelling when writing tex
setlocal spell
setlocal spelllang=en_us

" One line per phrase, soft-wrap the text
setlocal breakindent
setlocal linebreak
setlocal wrap

" Make movent over wrapped lines easier
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" Remove some distracting ui elements
let g:signify_disable_by_default = 1
setlocal colorcolumn=""
setlocal nonumber

let g:tex_conceal = 'abdmg'
let g:tex_flavor = 'latex'

" Split lines at puncutation
function! SplitLines(start, end)
    silent execute a:start.','.a:end.'s/[.!?]\zs /\r/g'
endfunction

set formatexpr=SplitLines(v:lnum,v:lnum+v:count-1)

nnoremap <LocalLeader>bo  :call OpenCiteKeyPdf(expand("<cword>"))<CR>
nnoremap <LocalLeader>p :silent exec "!caffeinate -d dspdfviewer -d 1 _build/%:r.pdf &"<CR>
