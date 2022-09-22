export EDITOR=vim
export NNN_OPTS="er"
export NNN_OPENER="$HOME/bin/opener.sh"
export PATH="$PATH:$HOME/bin"

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    export MOZ_ENABLE_WAYLAND=1
    export _JAVA_AWT_WM_NONREPARENTING=1
    export XDG_CURRENT_DESKTOP=sway

    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK

    exec sway
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc
