setlocal nonumber
setlocal textwidth=80
setlocal concealcursor=""
let g:tex_conceal = 'abdmg'

if has('nvim')
lua << EOF
  require('cmp').setup.buffer {
    sources = {
      { name = 'snippy' },
      { name = 'path' },
      { name = 'orgmode' },
      { name = 'omni' },
      { name = 'buffer', keyword_length = 5 },
      { name = 'treesitter' }
    },
  }
EOF
endif

nnoremap <silent> <LocalLeader>z :set opfunc=ConvertPinyin<CR>g@
vnoremap <silent> <LocalLeader>z :<C-U>call ConvertPinyin(visualmode(), 1)<CR>

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

  let chars = systemlist(l:script_path . " '" . @@ . "'")
  let @p = join(chars, "\n")

  call popup_clear()
  call popup_atcursor(chars, {'padding': [0,1,0,1], 'border': [1,1,1,1]})

  let @@ = l:reg
  let &selection = sel
  call setpos('.', pos)
endfunction
