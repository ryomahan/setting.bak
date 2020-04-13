" Ryoma's vimrc
" 1. git clone https://github.com/VundleVim/Vundle.vim.git
" ~/.vim/bundle/Vundle.vim
" 2. vim +PluginInstall +qall

" System base set
set number            " open number
set backspace=2       " make <backspace> useful
set nocompatible      " hear of anything that might helpful
set encoding=utf-8    " set codde
set tabstop=4         " set tab to four spaces
set softtabstop=4     " set backspace to four spaces 
set shiftwidth=4      " 
set expandtab         " use space instead of tab
set autoindent        " auto tab

filetype off

" Vundle Plugin
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'morhetz/gruvbox'

call vundle#end()

filetype plugin indent on

" Add separate settings for different file types
if has("autocmd")
    autocmd FileType javascript set tabstop=2
    autocmd FileType javascript set softtabstop=2
    autocmd FileType javascript set shiftwidth=2
endif

" Set map leader for myself
let mapleader=','
let maplocalleader='\\'

" Set map(use noremap) 
nnoremap - dd
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>"  viw<esc>a"<esc>"hbi"<esc>lel

inoremap jk     <esc>
inoremap <c-d>  <esc>ddi

" Use map to realize Move Up/Down
nnoremap <c-j> mz:m+<cr>`z
nnoremap <c-k> mz:m-2<cr>`z
inoremap <c-j> <esc>mz:m+<cr>`zi
inoremap <c-k> <esc>mz:m-2<cr>`zi

" Use map to realize Home/End
noremap <c-e> <end>
noremap <c-a> <home>
inoremap <c-e> <end>
inoremap <c-a> <home>

" Set notes shortcut keys(use autocmd and noremap)

" Set abbreviations
iabbrev @@ ryomahan1996@gmail.com

" Set statusline
set laststatus=2 " always show statusline
" set statusline=%f\ |\ %{&ff}\ |\ [(%l,\ %v),\ %p] 
set statusline=%F%m%r%h%w%=\ [(%04l,%04v),\ %p%%]

" color theme
colorscheme gruvbox
