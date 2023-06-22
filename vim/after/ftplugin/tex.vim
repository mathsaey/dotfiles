" Use us spelling when writing tex
setlocal spell
setlocal spelllang=en_us

" One line per phrase, soft-wrap the text
setlocal breakindent
setlocal linebreak
setlocal wrap

" Make movent over wrapped lines easier
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" Remove some distracting ui elements
let g:signify_disable_by_default = 1
setlocal colorcolumn=""
setlocal nonumber

let g:tex_conceal = 'abdmg'
let g:tex_flavor = 'latex'

" VimTex has really good completion, let's use it as much as possible.
if has('nvim')
lua << EOF
  require('cmp').setup.buffer {
    formatting = {
      format = function(entry, item)
          if entry.source.name == "omni" then
            item.menu = vim.inspect(item.menu):gsub('%"', "")
            item.kind = "[VimTex]"
          else
            item.kind = string.format("[%s]", entry.source.name)
        end
          return item
        end,
    },
    sources = {
      { name = 'snippy' },
      { name = 'omni' },
      { name = 'buffer', keyword_length = 5 },
    },
    completion = {
      }

  }
EOF
endif
