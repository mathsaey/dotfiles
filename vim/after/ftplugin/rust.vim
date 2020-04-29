map <LocalLeader>s :terminal cargo run<CR>
map <LocalLeader>S :terminal cargo build<CR>
map <LocalLeader>t :terminal cargo test<CR>
map <LocalLeader>f :RustFmt<CR>

" Tell gutentags that a project is a rust project if a Cargo.toml file is present
call add(g:gutentags_project_info, {'type': 'rust', 'file': 'Cargo.toml'})

" Follow rust formatting conventions
setlocal colorcolumn=-80,+100
