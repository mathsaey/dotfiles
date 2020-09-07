" Mainly intended to be used from (neo)mutt.

" I send most of my mails in Dutch.
setlocal spell
setlocal spelllang=nl

" Mails are composed in temporary files. Don't store undo history or swap.
setlocal noundofile
setlocal noswapfile

" Ensure we don't modify settings based on mail content
setlocal nomodeline

" Line numbers are pretty pointless for mails
setlocal nonumber

" Formatting:
" - mail width is 72 chars
" - auto wrap based on text width
" - handle comment (quote) charachter
" - allow gq to format comments
" - Format-flowed: trailing white space indicates paragraph continue next line
" - Don't reformat long lines when entering insert mode
setlocal colorcolumn=72
setlocal formatoptions=tcqwl

" Reformat the text make it flow, requires `par`.
" Handy when replying to emails.
" Based on: https://www.mdlerch.com/emailing-mutt-and-vim-advanced-config.html
function! Preformat()
  :g/^>\s\=--\s\=$/,$ delete " Remove old signatures
  execute '%!par w72q'
  :%s/^.\+\ze\n\(>*$\)\@!/\0 /e " Flow the text, i.e. add trailing spaces
  :%s/^>*\zs\s\+$//e " Remove superflous trailing whitespace after quotes
  :1
  :put! =\"\n\n\" " Add whitespace between our text and quoted text
  :1
endfunction

nnoremap <LocalLeader>f :silent call Preformat()<CR>

" Open neomutt in read only mode, useful to read other mails
nnoremap <LocalLeader>m :botright vertical terminal ++close neomutt -R<CR>

" I generally start typing right away when writing emails.
startinsert
