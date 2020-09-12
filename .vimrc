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
Plug 'scrooloose/nerdtree'
Plug 'valloric/youcompleteme'
call plug#end()
map m :NERDTreeVCS<CR>
autocmd BufWritePost *.tex silent !
  \ latexmk -pdf -cd -silent "<afile>" &>/dev/null &&
  \ latexmk -c -cd -silent "<afile>" &&
  \ (xdotool key --window `xdotool search --class mupdf` r &>/dev/null ||
  \ fn="<afile>" &&
  \ (mupdf "${fn\%.*}.pdf" </dev/null &>/dev/null &))
