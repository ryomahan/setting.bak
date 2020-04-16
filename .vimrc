" Ryoma's vimrc
" 1. install latest vim
" 2. git clone https://github.com/gmarik/vundle.git
" 3. vim +PluginInstall +qall

" System base set
syntax      on        " highlight
colorscheme gruvbox   " set colorscheme

set number            " open number
set backspace=2       " make <backspace> useful
set nocompatible      " hear of anything that might helpful
set encoding=utf-8    " set codde
set tabstop=4         " set tab to four spaces
set softtabstop=4     " set backspace to four spaces 
set shiftwidth=4      " 
set expandtab         " use space instead of tab
set autoindent        " auto tab

" Add separate settings for different file types
if has("autocmd")
    autocmd FileType html,css,xml,yaml,javascript set tabstop=2
    autocmd FileType html,css,xml,yaml,javascript set softtabstop=2
    autocmd FileType html,css,xml,yaml,javascript set shiftwidth=2
    autocmd FileType javascript set tabstop=2
    autocmd FileType javascript set softtabstop=2
    autocmd FileType javascript set shiftwidth=2
endif

" map
"""" Set map leader for myself
let mapleader=','
let maplocalleader='\\'

"""" Set map(use noremap) 
nnoremap - dd
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>"  viw<esc>a"<esc>"hbi"<esc>lel

inoremap jk     <esc>
inoremap <c-d>  <esc>ddi

"""" Use map to realize Move Up/Down
nnoremap <c-j> mz:m+<cr>`z
nnoremap <c-k> mz:m-2<cr>`z
inoremap <c-j> <esc>mz:m+<cr>`zi
inoremap <c-k> <esc>mz:m-2<cr>`zi

"""" Use map to realize Home/End
noremap <c-e> <end>
noremap <c-a> <home>
inoremap <c-e> <end>
inoremap <c-a> <home>

" Set notes shortcut keys(use autocmd and noremap)

""""" Set abbreviations
iabbrev @@ ryomahan1996@gmail.com

" Change cursor shape in difference modes
" from https://vim.fandom.com/wiki/Change_cursor_shape_in_different_modes
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" Set statusline
set laststatus=2 " always show statusline

" set statusline=%f\ |\ %{&ff}\ |\ [(%l,\ %v),\ %p] 
set statusline=%F%m%r%h%w%=\ [(%04l,%04v),\ %p%%]
