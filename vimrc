" Vimrc
" Mathijs Saey

set nocompatible                                    " Discard vi compatibility

" ------------ "
" Vundle Setup "
" ------------ "

filetype off                                        " Temporarily turn off filetype detection
set rtp +=~/.vim/bundle/Vundle.vim                  " Add vundle to the runtime path
call vundle#begin()                                 " Start Vundle plugin list

" Plugin list
" -----------

" Plugin manager
Plugin 'gmarik/Vundle.vim'                          " Let Vundle manage itself

" Visuals
Plugin 'tomasr/molokai'                             " Color scheme
Plugin 'bling/vim-airline'                          " Fancy status bar

" Git integration
Plugin 'tpope/vim-fugitive'                         " Git integration
Plugin 'airblade/vim-gitgutter'                     " Show diff in sidebar

" Tools
Plugin 'sjl/gundo.vim'                              " Visual undo tree
Plugin 'kien/ctrlp.vim'                             " Fuzzy file searching
Plugin 'xolox/vim-misc'                             " General scripts, required for vim-session
Plugin 'jceb/vim-orgmode'                           " Org mode for vim
Plugin 'godlygeek/tabular'                          " Easily align stuff
Plugin 'xolox/vim-session'                          " Session Management
Plugin 'tpope/vim-surround'                         " Easily change surrounding brances, quotes, ...
Plugin 'vim-scripts/Tagbar'                         " File minimap
Plugin 'vim-scripts/utl.vim'                        " Universal text linking (required for vim-orgmode)
Plugin 'chrisbra/improvedft'                        " Makes f and t work on multiple lines
Plugin 'tpope/vim-commentary'                       " Easily turn lines into comments
Plugin 'scrooloose/syntastic'                       " Linter
Plugin 'tpope/vim-speeddating'                      " Date tools for vim, required for vim-orgmode
Plugin 'rbgrouleff/bclose.vim'                      " Close buffer without changing layout
Plugin 'Valloric/YouCompleteMe'                     " Tab completion
Plugin 'pthrasher/conqueterm-vim'                   " Shell integration
Plugin 'terryma/vim-expand-region'                  " Easily select regions
Plugin 'vim-scripts/DeleteTrailingWhitespace'       " Allow the automatic deletion of trailing whitespace

" Languages
Plugin 'zah/nimrod.vim'                             " Nim support
Plugin 'derekwyatt/vim-scala'                       " Scala support
Plugin 'LaTeX-Box-Team/LaTeX-Box'                   " Latex support
Plugin 'octol/vim-cpp-enhanced-highlight'           " Better CPP syntax highlighting

call vundle#end()                                   " End of plugin list

filetype plugin indent on                           " Turn on filetype detection and indentation

" ----------- "
" Look & Feel "
" ----------- "

" Line numbers
set ruler                                           " Show line and column number
set number                                          " Draw line numbers
set cursorline                                      " Highlight current line
set colorcolumn=80                                  " Show a line on column 80

" Scroll bars
set guioptions-=r                                   " Hide right scrollbar
set guioptions-=l                                   " Hide left scrollbar
set guioptions-=L                                   " Hide left scrollbar when multiple panels exist

" Color Scheme
set t_Co=256                                        " Enable 256 color support
syntax enable                                       " Enable syntax highlighting
colorscheme molokai                                 " Set color scheme

" Font
set guifont=Menlo:h12                               " Set text font

" Status Bar + Airline
set laststatus=2                                    " Always show the status bar
set guifont=Meslo\ LG\ L\ Regular\ for\ Powerline   " Custom powerline font

" Buffer list
let g:airline_powerline_fonts=1                     " Populate airline font symbol table
let g:airline#extensions#tabline#enabled=1          " Show open buffers
let g:airline#extensions#tabline#buffer_min_count=2 " Only show tab line when at least two buffers are open
let g:airline#extensions#tabline#left_sep = ' '     " No left seperator
let g:airline#extensions#tabline#left_alt_sep = '|' " Use | as the right seperator for 'straightrtabs

" Temporary Files
set backupdir=~/.tmp/vim/backup//                   " Directory for file backups
set directory=~/.tmp/vim/swap//                     " Directory for swap files
set undodir=~/.tmp/vim/undo//                       " Directory for undo files

" Sessions
let g:session_autosave='yes'                        " Always save sessions when quitting vim
let g:session_autoload = 'no'                       " Don't prompt for opening old sessions
let g:session_autosave_periodic=1                   " Save session every minute

" Misc
set title                                           " Let vim set the window title
set ttyfast                                         " Indicates the terminal is fast and more chars can be sent
set wildmenu                                        " Shows the available autocompletes in command menu
set lazyredraw                                      " Don't always redraw the screen
set backspace=indent,eol,start                      " Allow backspaces to remove more

let g:DeleteTrailingWhitespace_Action = 'delete'    " Remove trailing whitespace on save

" -------------- "
" Tabs & Spacing "
" -------------- "

set tabstop=2                                       " Draw tabs as 2 spaces
set shiftwidth=2                                    " Use 2 spaces as automatic indentation
set softtabstop=2                                   " Insert and remove tabs as 2 spaces
set autoindent                                      " Automatically copy amount of leading tabs from previous lines
set smartindent                                     " Add extra tabs in some cases
set expandtab                                       " Expand tabs to spaces

set list                                            " Visualize tabs, trailing spaces and various elements
set listchars=tab:--                                " When list is enabled use - to mark tabs
set listchars+=trail:~                              " When list is enabled use ~ to mark trailing spaces
set listchars+=extends:>                            " When list is enabled use > to mark that a line continues beyond the edge of the screen
set listchars+=precedes:<                           " When list is enabled use < to mark that a line starts beyond the left edge of the screen
set listchars+=conceal:*                            " When list is enabled use * to mark hidden charachters
set listchars+=nbsp:.                               " When list is enabled use . to mark non-breakable spaces

set formatoptions-=t                                " Don't auto-insert newlines when exceeding 80 characters
set wrapmargin=0                                    " Don't wrap based on screen edge

" --------------- "
" Search Settings "
" --------------- "

set incsearch                                       " Highlight charachters as they are matched
set hlsearch                                        " Highlight matches
set showmatch                                       " Highlight matching [{()}]

set ignorecase                                      " Don't match case
set smartcase                                       " Unless the search term contains uppercase

" ------------------- "
" Custom Key Bindings "
" ------------------- "

let mapleader = "\<Space>"                          " Use space as leader

nnoremap <Leader>w :write<CR>                       " Save with leader-w

" Spelling
nnoremap <Leader>so  :setlocal spell<CR>            " Turn on spelling
nnoremap <Leader>st  :setlocal nospell<CR>          " Turn off spelling
nnoremap <Leader>sn  :setlocal spelllang=nl<CR>     " Use Dutch
nnoremap <Leader>seb :setlocal spelllang=en_gb<CR>  " Use British English
nnoremap <Leader>sea :setlocal spelllang=en_us<CR>  " Use American English

" ------------------- "
" ConqueTerm Settings "
" ------------------- "

let g:ConqueTerm_ReadUnfocused = 1                  " Keep on refereshing when buffer is not active
let g:ConqueTerm_StartMessages = 1                  " Show warnings on startup when necessary
let g:ConqueTerm_TERM = 'xterm-256color'            " Report color support for prettier output

let g:Conque_syntax_assoc = {}                      " Language to command mapping for syntax highlighting
let g:Conque_syntax_assoc.python3 = 'python'        " Only required when the command and the syntax names differ.
let g:Conque_syntax_assoc.ghci    = 'haskell'
let g:Conque_syntax_assoc.irb     = 'ruby'

function Conque_set_syntax(term)
    if has_key(g:Conque_syntax_assoc, a:term.program_name)
        execute 'setlocal syntax=' . g:Conque_syntax_assoc[a:term.program_name]
    else
        execute 'setlocal syntax=' . a:term.program_name
    endif
endfunction

call conque_term#register_function('after_startup', 'Conque_set_syntax')

" --------------- "
" Custom Commands "
" --------------- "

" Creates a fancy comment box given a string
function CommentBox(msg)
  let com = substitute(&commentstring, '%s', '', '')
  let com = substitute(l:com, ' ', '', '')
  let len = strlen(a:msg)

  let sur  = l:com . ' ' . repeat('-', l:len) . ' ' . l:com
  let mid  = l:com . ' ' . a:msg . ' ' . l:com

  call append('.', sur)
  call append('.', mid)
  call append('.', sur)
endfunction

command -nargs=* CommentBox call CommentBox(<q-args>)
