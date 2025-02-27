_exp() { [[ -z "${!1}" && -x "$2" ]] && export "$1=$2"; }

_exp EDITOR /usr/bin/vim

if [[ -x /usr/bin/nnn ]]; then
    export NNN_OPTS=Aer
    export NNN_TRASH=1
    export NNN_FCOLORS=D4DEB778E79F9F67D2E5E5D2
    export NNN_ARCHIVE='\.(7z|bz2|gz|tar|tgz|zip|rar)$'
fi

[[ -d "${HOME}/bin" ]] && export PATH="${PATH}:${HOME}/bin"

_exp CXX /usr/bin/clang++
_exp CC /usr/bin/clang

if [[ -z "${DISPLAY}" ]] && [[ "${XDG_VTNR}" -eq 1 ]]; then
    if [[ -x /usr/bin/sway ]]; then
        export MOZ_ENABLE_WAYLAND=1
        export QT_QPA_PLATFORM=wayland
        export SDL_VIDEODRIVER=wayland
        export _JAVA_AWT_WM_NONREPARENTING=1
        exec /usr/bin/sway &>/dev/null
    fi
    if [[ -x /usr/bin/startx ]]; then
        exec /usr/bin/startx &>/dev/null
    fi
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc
