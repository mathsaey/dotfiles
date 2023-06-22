function! OpenR5RS(path)
  let prelude = [
  \   "(load \"" . a:path . "\")",
  \   "(#%require readline)"
  \ ]->join("") . "\<CR>"

  call OpenTerminal("plt-r5rs")
  call feedkeys(prelude, 'nt')
endfunction

" Probleem: evaluatie gebeurt later
nnoremap <LocalLeader>s :call OpenR5RS(@%)<CR>
