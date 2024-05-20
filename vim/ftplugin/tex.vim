" Vimtex settings need to be set before vimtex is loaded
if has('mac')
  let g:vimtex_view_method = 'skim'
elseif has('linux')
  " Only start the vim server when using vimtex
  if empty(v:servername) && exists('*remote_startserver')
    call remote_startserver('VIM')
  endif
  let g:vimtex_view_method = 'zathura_simple'
endif
