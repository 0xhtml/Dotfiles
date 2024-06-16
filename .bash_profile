export EDITOR=vim
export NNN_OPTS="Aer"
export NNN_OPENER="mimeopen"
export NNN_TRASH=1
export PATH="$PATH:$HOME/bin"

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    exec startx &>/dev/null
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc
