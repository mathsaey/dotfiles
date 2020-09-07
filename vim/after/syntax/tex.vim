" Add some extra conceal symbols
syn match texMathSymbol '\\cupdot\>' contained conceal cchar=⊍

" Work around an annoying issue in tex_conceal.vim:
" https://github.com/KeitaNakamura/tex-conceal.vim/issues/4
highlight Conceal ctermbg=NONE
highlight Conceal ctermfg=NONE
highlight Conceal guifg=NONE
highlight Conceal guibg=NONE
