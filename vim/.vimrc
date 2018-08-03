"""""""""""""""""""""
" COLOR
"""""""""""""""""""""
syntax enable
set t_Co=256
let iterm_profile = $XMODIFIERS 
if iterm_profile == "light"
    set background=light
    colorscheme morning
else
    set background=dark
    colorscheme Dark
endif

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
