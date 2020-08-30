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
  \ e='<afile>' &&
  \ ne=${e\%.*} &&
  \ nf=${e\%/*} &&
  \ pdflatex -interaction=nonstopmode -output-directory="$nf" "$e" >/dev/null &&
  \ rm -f "${ne}.log" "${ne}.tox" "${ne}.aux" &&
  \ w=`xdotool search --class mupdf` &&
  \ [ "$w" \!= "" ] &&
  \ xdotool key --window "$w" r
