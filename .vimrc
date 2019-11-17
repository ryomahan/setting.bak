" Ryoma's vimrc for mac
" 1. brew install vim (to install latest vim)
" 2. git clone https://github.com/gmarik/vundle.git
" 3. vim +PluginInstall +qall

" System base set
set number            " open number
set backspace=2       " make <backspace> useful
set nocompatible      " hear of anything that might helpful
set encoding=utf-8    " set codde

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
" TODO

" Set abbreviations
iabbrev @@ ryomahan1996@gmail.com

" Set statusline
set laststatus=2 " always show statusline
" set statusline=%f\ |\ %{&ff}\ |\ [(%l,\ %v),\ %p] 
set statusline=%F%m%r%h%w%=\ [(%04l,%04v),\ %p%%]
