map <LocalLeader>s :call OpenTerminal('cargo run')<CR>
map <LocalLeader>S :call OpenTerminal('cargo build')<CR>
map <LocalLeader>t :call OpenTerminal('cargo test')<CR>
map <LocalLeader>f :RustFmt<CR>

if has('nvim')
  " Tell gutentags that a project is a rust project if a Cargo.toml file is present
  call add(g:gutentags_project_info, {'type': 'rust', 'file': 'Cargo.toml'})
endif

" Follow rust formatting conventions
setlocal colorcolumn=100
