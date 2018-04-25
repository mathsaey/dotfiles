setlocal spelllang=en_us   " Use US English when we want to spellcheck comments
setlocal formatprg=mix\ format\ -

let g:mix_format_on_save = 1 " Use the mix formatter when saving
let g:mix_format_options = '--check-equivalent'
