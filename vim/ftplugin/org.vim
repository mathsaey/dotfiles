" Only useful for notes on papers: open the pdf of the paper with a citekey
" that is identical to the basename of the current file.
nnoremap <LocalLeader>bo :call OpenCiteKeyPdf(expand("%:r"))<CR>
