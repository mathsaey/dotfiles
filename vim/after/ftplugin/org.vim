setlocal nonumber
setlocal textwidth=80
setlocal concealcursor=""
let g:tex_conceal = 'abdmg'

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

if has('nvim')
lua << EOF
local mappings = require('orgmode.org.mappings')
local utils = require('orgmode.utils')
local fs = require('orgmode.utils.fs')

-- nvim-orgmode's substitute_path does not handle relative paths that don't
-- start with ./
local function expand_path(path_str)
  local working_dir = vim.fn.fnamemodify(utils.current_file_path(), ':p:h')

  if path_str:match('^/') then
    return path_str
  elseif path_str:match('^~/') then
    return vim.fn.fnamemodify(path, ':p')
  elseif path_str:match('^%.%./') then
    return working_dir .. '/' .. path_str
  elseif path_str:match('^%./') then
    return working_dir .. '/' .. path_str:gsub('^%./', '')
  else
    return working_dir .. '/' .. path_str
  end
end

local function open_link()
  local link = mappings._get_link_under_cursor()
  if link and link.url:is_file_only() then
    local path = expand_path(link.url:get_file())
    return vim.fn['netrw#BrowseX'](path, vim.fn['netrw#CheckIfRemote']())
  else
    return mappings:open_at_point()
  end
end

vim.keymap.set('n', '<LocalLeader>l', open_link, {buffer = 0})
EOF
endif
