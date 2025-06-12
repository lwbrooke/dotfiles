set nocompatible

let mapleader=","
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
" starting fold level all (within reason) open
set nofoldenable
" backspace behaves as in other apps while in insert mode
set backspace=indent,eol,start
" use buffers
set hidden
" show line numbers
set number
" default to using relativenumber
set relativenumber
" show cmd in bottom bar
set showcmd
" highlight current line
set cursorline
" highlight columns 80 and 120-999
let &colorcolumn="120"
" visual autocomplete for menu
set wildmenu
" highlight matching [{()}]
set showmatch
" don't wrap lines
set nowrap
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
