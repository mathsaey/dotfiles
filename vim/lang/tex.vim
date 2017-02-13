" -------------- "
" Local Settings "
" -------------- "

setlocal spell                 " Turn on spelling when writing tex
setlocal spelllang=en_us       " Use US English spelling by default

setlocal textwidth=80          " Wrap at 80 characters
setlocal linebreak             " Turn on line wrapping

" --------------- "
" vimtex Settings "
" --------------- "

let g:vimtex_view_general_viewer
  \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'

let g:vimtex_latexmk_continuous = 1

let g:vimtex_view_general_options = '-r @line @pdf @tex'

" This adds a callback hook that updates Skim after compilation
let g:vimtex_latexmk_callback_hooks = ['UpdateSkim']

function! UpdateSkim(status)
  if !a:status | return | endif

  let l:out = b:vimtex.out()
  let l:tex = expand('%:p')
  let l:cmd = [g:vimtex_view_general_viewer, '-r']
  if !empty(system('pgrep Skim'))
    call extend(l:cmd, ['-g'])
  endif
  if has('nvim')
    call jobstart(l:cmd + [line('.'), l:out, l:tex])
  elseif has('job')
    call job_start(l:cmd + [line('.'), l:out, l:tex])
  else
    call system(join(l:cmd + [line('.'), shellescape(l:out), shellescape(l:tex)], ' '))
  endif
endfunction

