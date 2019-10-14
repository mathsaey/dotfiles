nnoremap <LocalLeader>n :call CreateNotesFile()<CR>

function! CreateNotesFile()
  " Fetch citekey and create file name
  execute "normal! ?@\<cr>f{l"
  let l:key = expand("<cword>")
  let l:file = l:key . '.org'

  " Fetch title
  let l:register = @t
  execute "normal! /title\<cr>2wv$2h\"ty"
  let l:title = 'Notes on "' . substitute(@t, '[{}]', "", "g") . '"'
  let @t = l:register

  " Create file if needed
  execute 'edit ' . l:file
  if !filereadable(l:file)
    call append(0, "#+TITLE: " . l:title)
  endif
endfunction
