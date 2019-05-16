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

function! OpenBibPdf()
  let l:key = expand("<cword>")
  let l:cmd =
        \ 'curl --silent ' .
        \ '''http://127.0.0.1:23119/zotxt/items?format=paths&betterbibtexkey=' .
        \ l:key . "'"
  let l:json = system(l:cmd)
  if l:json != ""
    silent exec '!open ' . shellescape(json_decode(l:json)[0].paths[0])
  else
    echohl WarningMsg | echom l:key "not found" | echohl None
  endif
endfunction

nnoremap <LocalLeader>bo  :call OpenBibPdf()<CR>
