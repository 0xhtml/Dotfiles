set nu
set wildmenu
set autoindent
set expandtab
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()
Plug 'AlphaMycelium/pathfinder.vim'
Plug 'scrooloose/nerdtree'
call plug#end()
map m :NERDTreeVCS<CR>
