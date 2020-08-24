set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'morhetz/gruvbox'

call vundle#end()
filetype plugin indent on

" Enable colorsheme
syntax on
colorscheme gruvbox

" Disable arrow keys for adopt vim navigation
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
