export EDITOR=vim
export NNN_OPTS="Aer"
export NNN_OPENER="$HOME/bin/opener.sh"
export PATH="$PATH:$HOME/bin"

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    exec startx
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc
