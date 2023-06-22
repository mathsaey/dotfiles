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
"   (disabled, add w to reenable)
" - Don't reformat long lines when entering insert mode
" - Don't delete trailing whitespace as it ruins format-flowed
setlocal colorcolumn=72
setlocal formatoptions=tcqwl
let b:DeleteTrailingWhitespace = 0

" Set wrap for long text in quoted mail
setlocal wrap

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

" Toggle the format flowed flag.
" Checks if the 'w' option is present in formatoptions and adds it or removes
" it as needed.
function! ToggleFormatFlowed()
  if stridx(&formatoptions, "w") >= 0
    set formatoptions-=w
  else
    set formatoptions+=w
  endif
endfunction

nnoremap <LocalLeader>r :silent call Preformat()<CR>
nnoremap <LocalLeader>f :silent call ToggleFormatFlowed()<CR>

" I generally start typing right away when writing emails.
startinsert
