setlocal makeprg=python\ %

let g:syntastic_python_checkers=['python', 'pylint', 'pyflakes']

command! Pyshell execute "ConqueTerm\ python"
command! Pyrun   execute "ConqueTerm\ python\ -i\ ".expand('%')

command! Pyshell3 execute "ConqueTerm\ python3"
command! Pyrun3   execute "ConqueTerm\ python3\ -i\ ".expand('%')
