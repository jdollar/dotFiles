filetype off

set rtp+=~/.vim/bundle/Vundle.vim

set nocompatible
set number
set term=xterm-256color
set background=dark
set laststatus=2
set nowrap

set tags=./tags;$HOME

set expandtab
set tabstop=4
set shiftwidth=4

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:solarized_termcolors= 256

call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'jeetsukumaran/vim-filebeagle'

call vundle#end()

set autoindent
syntax enable
colorscheme solarized
