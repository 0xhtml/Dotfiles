_exp() { [[ -z "${!1}" && -x "$2" ]] && export "$1=$2"; }
_exp EDITOR /usr/bin/vim
_exp CXX /usr/bin/g++
_exp CC /usr/bin/gcc

if [[ -x /usr/bin/nnn ]]; then
    export NNN_OPTS=Ae
    export NNN_TRASH=1
    export NNN_FCOLORS=D4DEB778E79F9F67D2E5E5D2
    export NNN_ARCHIVE='\.(tar(\.(xz|gz))|zip?)$'
fi

[[ -d "${HOME}/bin" ]] && export PATH="${PATH}:${HOME}/bin"

if [[ -z "${DISPLAY}" ]] && [[ "${XDG_VTNR}" -eq 1 ]] && [[ -x /usr/bin/sway ]]; then
    export MOZ_ENABLE_WAYLAND=1
    export QT_QPA_PLATFORM=wayland
    export SDL_VIDEODRIVER=wayland,x11
    export _JAVA_AWT_WM_NONREPARENTING=1
    exec /usr/bin/sway &>/dev/null
fi

[[ -f /etc/bash.bashrc ]] && . /etc/bash.bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc
