function! OpenR5RS(path)
  let prelude = [
  \   "(load \"" . a:path . "\")",
  \   "(#%require readline)"
  \ ]->join("") . "\<CR>"

  let term = term_start("plt-r5rs", {"term_finish": "close"})
  call term_sendkeys("", prelude)
endfunction

" Probleem: evaluatie gebeurt later

nnoremap <LocalLeader>s :call OpenR5RS(@%)<CR>
