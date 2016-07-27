" -------------- "
" Local Settings "
" -------------- "

setlocal spell                 " Turn on spelling when writing tex
setlocal spelllang=en_us       " Use US English spelling by default
setlocal formatoptions+=t      " Auto-wrap when exceeding 80 charachters.
setlocal wrap linebreak nolist " Display long lines over multiple lines

" ----------------- "
" LatexBox Settings "
" ----------------- "

let g:LatexBox_viewer='open -a Skim'
let g:LatexBox_latexmk_async=1

" ----------- "
" Jump in PDF "
" ----------- "

" Enable synctex for forward searching
let g:LatexBox_latexmk_options =
      \ '-pdflatex="pdflatex -synctex=1 %O %S"'

" Jump to current line in PDF
map <silent> <LocalLeader>s :silent
      \ !/Applications/Skim.app/Contents/SharedSupport/displayline -r -g
      \ <C-R>=line('.')<CR> "<C-R>=LatexBox_GetOutputFile()<CR>"
      \ "%:p" <CR>

" --------------- "
" Custom Keybinds "
" --------------- "

map <LocalLeader>b <LocalLeader>ll<LocalLeader>s

