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
" general
" """""""
" Syntax checking
Plugin 'scrooloose/syntastic'

" code completion
" has compiled component
Plugin 'Valloric/YouCompleteMe'

" Hotkeys for commenting/uncommenting
Plugin 'tpope/vim-commentary'

" Manipulate surroundings of text objects
Plugin 'tpope/vim-surround'

" docker
" """"""
" Dockerfile syntax highlighting
Plugin 'ekalinin/Dockerfile.vim'

" html
" """"
" highlight matching tags
Plugin 'Valloric/MatchTagAlways'

" javascript
" """"""""""
" improved syntax highlighing
Plugin 'pangloss/vim-javascript'

" syntax highlighting for libraries
Plugin 'othree/javascript-libraries-syntax.vim'

" python
" """"""
" PEP8 checking
" $ pip install flake8 flake8-docstrings
Plugin 'nvie/vim-flake8'

" yaml
" """"
" yaml/ansible support
Plugin 'chase/vim-ansible-yaml'

" """"""""""
" navigation
" """"""""""
" split explorer
Plugin 'jeetsukumaran/vim-filebeagle'

" Window Swap
Plugin 'wesQ3/vim-windowswap'

" split navigation w/tmux
Plugin 'christoomey/vim-tmux-navigator'

" fuzzy search
Plugin 'ctrlpvim/ctrlp.vim'

" navigation(and other) mappings
Plugin 'tpope/vim-unimpaired'

" """"
" misc
" """"
" git plugins
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" status line
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" colorschemes
Plugin 'flazz/vim-colorschemes'

" repeat plugin commands
Plugin 'tpope/vim-repeat'

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
silent! colorscheme badwolf
" enable syntax highlighting
syntax on
" enable all Python syntax highlighting features
let python_highlight_all=1

" """""""""""""""""""""""""
" default tabs, spaces, and folding
" """""""""""""""""""""""""
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
" default to using relativenumber
set relativenumber
" show cmd in bottom bar
set showcmd
" highlight current line
set cursorline
" highlight columns 80 and 120-999
let &colorcolumn="80,".join(range(120,999),",")
" visual autocomplete for menu
set wildmenu
" redraw only when necessary
set lazyredraw
" highlight matching [{()}]
set showmatch
" enable mouse
set mouse=a
" don't wrap lines
set nowrap

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
" ignore node_modules directories
set wildignore+=*/node_modules/*
" ignore virtualenv directories
set wildignore+=*/venv/*,*/.virtualenv/*,*/.venv/*
" ignore test and coverage directories
set wildignore+=*/test_results/*,*/coverage/*
" ignore build directories
set wildignore+=*/dist/*,*/__pycache__/*

" """"""""""""""""""""""
" Swap file organization
" """"""""""""""""""""""
set directory^=$HOME/.vim/tmp//

" """"""""""""""""
" Custom Functions
" """"""""""""""""
" toggle relativenumber
function! NumberToggle()
    if(&relativenumber == 1)
        set norelativenumber
    else
        set relativenumber
    endif
endfunc

" toggle ctrlp_show_hidden
function! CtrlPShowHiddenToggle()
    if(g&:ctrlp_show_hidden == 1)
        let g:ctrlp_show_hidden=0
    else
        let g:ctrlp_show_hidden=1
    endif
endfunc

function! CmdInTemporaryBuffer(cmd)
    new
    setlocal buftype=nofile
    setlocal bufhidden=delete
    setlocal nobuflisted
    setlocal noswapfile
    execute "silent! r ! " . a:cmd
    setlocal nomodifiable
endfunc

function! Strip(input_string)
    return substitute(a:input_string, '^\s*\(.\{-}\)\s*$', '\1', '')
endfunction

" """"""""""""""""""""
" Normal Mode Mappings
" """"""""""""""""""""
" remove trailing whitespace
nnoremap <leader>rtw :%s/\s\+$//<CR>:nohlsearch<CR>
" yank whole file
nnoremap <leader>ywf ggvG$y
" shiftwith shortcut
nnoremap <leader>sw :set shiftwidth=
" j/k scroll by visual lines
" nnoremap j gj
" nnoremap k gk
" resource vimrc
nnoremap <leader>r :source ~/.vimrc<CR>
" clear current search
nnoremap <leader>cls :nohlsearch<CR>
" toggle relativenumber
nnoremap <leader>n :call NumberToggle()<CR>
" toggle ctrlp_show_hidden
nnoremap <leader>cph :call CtrlPShowHiddenToggle()<CR>
" close all other buffers
nnoremap <leader>cob :w \| %bd \| e#<CR>
" run runtests script and put output in current buffer
nnoremap <leader>pyt :call CmdInTemporaryBuffer("./runtests")<CR>
" run runtests script with coverage and put output in current buffer
nnoremap <leader>pyc :call CmdInTemporaryBuffer("./runtests -c")<CR>
" autopep8 current file
nnoremap <leader>p8 :silent execute "! autopep8 -aa --max-line-length 119 --in-place --verbose --ignore E309 %"<CR> \| :redraw!<CR> \| :edit!<CR>
" start temporary buffer command
nnoremap <leader>cli :call CmdInTemporaryBuffer("")<Left><Left>

" """""""""""""
" Auto Commands
" """""""""""""
" start minimap
" autocmd VimEnter * Minimap

" """""""""
" syntastic
" """""""""
let venv = $VIRTUAL_ENV
if venv ==? ""
    let g:syntastic_python_python_exec = '/usr/bin/python3'
else
    let g:syntastic_python_python_exec = venv . '/bin/python'
endif

" """""""""""""
" YouCompleteMe
" """""""""""""
" ensure autocomplete window goes away
let g:ycm_autoclose_preview_window_after_completion=1
" goto function shortcut
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>doc :YcmCompleter GetDoc<CR>
" completion for python 3
let venv = $VIRTUAL_ENV
if venv ==? ""
    let g:ycm_python_binary_path = '/usr/bin/python3'
else
    let g:ycm_python_binary_path = venv . '/bin/python'
endif

" """"""""""
" vim-flake8
" """"""""""
let flake8_location = substitute(system("which flake8"), '\n$', '', '')
if flake8_location !=? ""
    let g:flake8_cmd = flake8_location
endif

" """""""""""
" vim-airline
" """""""""""
" show with single split
set laststatus=2
" use powerline fonts
let g:airline_powerline_fonts=1
" show buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
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
let g:airline_theme='badwolf'

" """""""""""""""""""""""""""""""
" javascript-libraries-syntax.vim
" """""""""""""""""""""""""""""""
let g:used_javascript_libs = 'angularjs,angularuirouter,requirejs,jasmine'
