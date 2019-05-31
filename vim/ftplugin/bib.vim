nnoremap <LocalLeader>o :call CreateNotesFile()<CR>

function! CreateNotesFile()
  " Move cursor to citekey
  execute "normal! ?@\<cr>f{l"
  let l:key = expand("<cword>")

  " Fetch title
  let l:register = @t
  execute "normal! /title\<cr>2wv$2h\"ty"
  let l:title = 'Notes on "' . substitute(@t, '[{}]', "", "g") . '"'
  let @t = l:register

  " Create file
  execute 'edit ' . l:key . '.org'
  call append(0, "#+TITLE: " . l:title)
endfunction
