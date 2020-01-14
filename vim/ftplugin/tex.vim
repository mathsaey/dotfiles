" Vimtex settings need to be set before vimtex is loaded
let g:vimtex_latexmk_continuous = 1
let g:vimtex_view_method = 'skim'

" ------------- "
" Folding Setup "
" ------------- "

let g:vimtex_fold_enabled = 1

let g:vimtex_fold_types = {
      \ 'envs': {'enabled': 0},
      \ 'env_options': {'enabled': 0},
      \ 'cmd_single': {'enabled': 0},
      \ 'cmd_single_opt': {'enabled': 0},
      \ 'cmd_multi': {'enabled': 0},
      \ 'cmd_addplot': {'enabled': 0}
\}
