"""""""""""""""""""""
" COLOR
"""""""""""""""""""""
syntax enable
set background=dark
colorscheme slate

"""""""""""""""""""""
" CUSTOMIZATION
"""""""""""""""""""""
" longer history
set history=10000
" enable search highlighting
set hlsearch
" adjust tabbing and expand
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
" searches are case-insensitive unless there are upper case chars
set ignorecase smartcase
" highlight current line
set cursorline
" always show tabs
set showtabline=2
" keep content when scrolling off the buffer
set scrolloff=3
" allow backspacing in insert mode
set backspace=indent,eol,start
" display incomplete commands
set showcmd

"""""""""""""""""""""
" POWERLINE 
"""""""""""""""""""""
set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim/
" Always show statusline
set laststatus=2
