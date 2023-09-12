map <LocalLeader>s :call terminal cargo run<CR>
map <LocalLeader>S :call terminal cargo build<CR>
map <LocalLeader>t :call terminal cargo test<CR>
map <LocalLeader>f :RustFmt<CR>

" Tell gutentags that a project is a rust project if a Cargo.toml file is present
call add(g:gutentags_project_info, {'type': 'rust', 'file': 'Cargo.toml'})

" Follow rust formatting conventions
setlocal colorcolumn=100
