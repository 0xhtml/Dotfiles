export EDITOR=vim
export NNN_OPTS=Aer
export NNN_TRASH=1
export NNN_FCOLORS=D4DEB778E79F9F67D2E5E5D2
export NNN_ARCHIVE='\.(7z|bz2|gz|tar|tgz|zip|rar)$'
export PATH="${PATH}:${HOME}/bin"
export CXX=/usr/bin/clang++
export CC=/usr/bin/clang

if [[ -z "${DISPLAY}" ]] && [[ "${XDG_VTNR}" -eq 1 ]]; then
    export _JAVA_AWT_WM_NONREPARENTING=1
    exec sway &>/dev/null
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc
