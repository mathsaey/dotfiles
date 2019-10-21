" Only useful for notes on papers: open the pdf of the paper with a citekey
" that is identical to the basename of the current file.
nnoremap <LocalLeader>bo :call OpenCiteKeyPdf(expand("%:r"))<CR>

setlocal concealcursor=""
let g:tex_conceal = 'abdmg'

nnoremap <silent> <LocalLeader>zz :set opfunc=ConvertPinyin<CR>g@
vnoremap <silent> <LocalLeader>zz :<C-U>call ConvertPinyin(visualmode(), 1)<CR>

" Converts motion or visually selected text to pinyin
function! ConvertPinyin(type, ...)
  " Based on :h map-operator
  let script_path = '~/.scripts/char_to_pinyin'
  let sel = &selection
  let pos = getcurpos()
  let reg = @@

  if a:0
    normal! gvy
  elseif a:type == 'line'
    normal! '[V']y
  else
    normal! `[v`]y
  endif

  let chars = system(l:script_path . " " . @@)
  echom chars

  let @@ = l:reg
  let &selection = sel
  call setpos('.', pos)
endfunction
