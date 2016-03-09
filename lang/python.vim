setlocal makeprg=python\ %

command Pyshell execute "ConqueTerm\ python"
command Pyrun   execute "ConqueTerm\ python\ -i\ ".expand('%')

command Pyshell3 execute "ConqueTerm\ python3"
command Pyrun3   execute "ConqueTerm\ python3\ -i\ ".expand('%')
