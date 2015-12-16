set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" """""""""""""""
" code and syntax
" """""""""""""""
" PEP8 checking
" pip install flake8 and flake8-docstrings
Plugin 'nvie/vim-flake8'

" Syntax checking
Plugin 'scrooloose/syntastic'

" Dockerfile syntax highlighting
Plugin 'ekalinin/Dockerfile.vim'

" yaml/ansible support
Plugin 'chase/vim-ansible-yaml'

" code completion
" has compiled component (use --clang-completer)
Plugin 'Valloric/YouCompleteMe'

" Markdown preview
Plugin 'kannokanno/previm'

" Open browser
" used in conjuction with previm
Plugin 'tyru/open-browser.vim'

" Hotkeys for commenting/uncommenting
Plugin 'tpope/vim-commentary'

" """"""""""
" navigation
" """"""""""
" project drawer
" Plugin 'scrooloose/nerdtree'

" split explorer
Plugin 'jeetsukumaran/vim-filebeagle'

" Window Swap
Plugin 'wesQ3/vim-windowswap'

" minimap
Plugin 'severin-lemaignan/vim-minimap'

" """"
" misc
" """"
" git plugins
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" status line
Plugin 'bling/vim-airline'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Map leader key
let mapleader=","

" """"""
" colors
" """"""
" set colorscheme
set background=dark
colorscheme badwolf
" enable syntax highlighting
syntax on
" enable all Python syntax highlighting features
let python_highlight_all=1

" """""""""""""""
" tabs and spaces
" """""""""""""""
" number of visual spaces per tab
set tabstop=4
" spaces in tabs when editing
set softtabstop=4
" tabs are spaces
set expandtab
" size of auto-indent and >>, <<, ==
set shiftwidth=4
" auto indentation
set autoindent

" """""""
" buffers
" """""""
" use buffers
set hidden

" """"""""""
" UI options
" """"""""""
" show line numbers
set number
" show cmd in bottom bar
set showcmd
" highlight current line
set cursorline
" highlight columns 80 and 120
set colorcolumn=80
" visual autocomplete for menu
set wildmenu
" redraw only when necessary
set lazyredraw
" highlight matching [{()}]
set showmatch
" enable mouse
set mouse=a

" """""""""
" Searching
" """""""""
" search as character entered
set incsearch
" highlight search matches
set hlsearch
" case insensitive searching if all lowercase search
set ignorecase
" case sensitive if any uppercase entered
set smartcase
" clear current search
nnoremap <leader>cls :nohlsearch<CR>

" """""""""""""""
" Custom Mappings
" """""""""""""""
" remove trailing whitespace
nnoremap <leader>rtw :%s/\s\+$//<CR>
" yank whole file
nnoremap <leader>ywf ggvG$y
" shiftwith shortcut
nnoremap <leader>sw :set shiftwidth=

" """"""
" Previm
" """"""
" enable realtime markdown
let g:previm_enable_realtime = 1

" """"""""
" NERDTree
" """"""""
" show hidden (.*) files by default
" let NERDTreeShowHidden=1

" """""""""""""
" YouCompleteMe
" """""""""""""
" ensure autocomplete window goes away
let g:ycm_autoclose_preview_window_after_completion=1
" goto function shortcut
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" """"""""""
" vim-flake8
" """"""""""
" run flake8 after write
" autocmd BufWritePost *.py call Flake8()

" """""""""""
" vim-airline
" """""""""""
" show with single split
set laststatus=2
" use powerline fonts
let g:airline_powerline_fonts=1
" use unicode fonts
" if !exists('g:airline_symbols')
"   let g:airline_symbols = {}
" endif

" unicode symbols
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '◀'
" let g:airline_symbols.crypt = '🔒'
" let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.branch = '⎇'
" let g:airline_symbols.paste = '∥'
" let g:airline_symbols.whitespace = 'Ξ'
" theme
let g:airline_theme='bubblegum'
