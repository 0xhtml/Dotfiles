[[ $- != *i* ]] && return

if [[ -d ~/GitHub/Dotfiles ]]; then DOTFILES=~/GitHub/Dotfiles
elif [[ -d ~/Dotfiles ]]; then DOTFILES=~/Dotfiles
else
    echo "Dotfiles not found"
    return
fi

for f in "${DOTFILES}"/completion/?*.bash; do . $f; done
unset f

MANPAGES=$(grep '_[^s].=' "${DOTFILES}/man-pages/manpages.zshrc")
eval "${MANPAGES}" && export GROFF_NO_SGR=1
unset MANPAGES

unset DOTFILES

[[ -r "/usr/share/z/z.sh" ]] && . /usr/share/z/z.sh

alias diff="diff --color=auto"
alias grep="grep --color=auto"
alias ls="ls --color=auto -h"
alias ll="ls -l"
alias la="ll -A"
alias du="du -h"
alias df="df -h"
alias free="free -h"
alias nnn="echo 'Use Meta+n instead' && false"
alias n="nnn"
alias py="python "
hash trash 2>/dev/null && alias rm="echo 'Use trash instead of rm' && false"
alias mv="mv -i"
alias mnt="udiskie-mount "
alias umnt="udiskie-umount "
alias iftop="sudo iftop -i wlan0 -m 100m"
alias sudo="sudo "
alias watch="watch "

sudodiff() {
    [[ -z "$1" ]] && echo "Usage: sudodiff <file>" && return 1
    EDITOR="vimdiff '$1.pacnew'" sudoedit "$1"
}

pyprof() {
    F=$(mktemp)
    python -m cProfile -o ${F} $@
    gprof2dot -f pstats ${F} | dot -Tpng | feh -. -
}

nnn_info() {
    [[ -n ${NNNLVL} ]] && echo "(N${NNNLVL}) "
}
env_info() {
    [[ -n ${VIRTUAL_ENV} ]] && echo "($(basename "$(dirname "${VIRTUAL_ENV}")")/$(basename "${VIRTUAL_ENV}")) "
}
git_info() {
    local git_ref
    git_ref=$(git symbolic-ref --short HEAD 2>/dev/null)
    [[ -n "${git_ref}" ]] || git_ref=$(git describe --tags --always 2>/dev/null)
    [[ -n "${git_ref}" ]] && echo "(${git_ref}) "
}
host_info() {
    [[ -n ${SSH_CLIENT} ]] && echo "\u@\H "
}
VIRTUAL_ENV_DISABLE_PROMPT=true
PS1="\[$(tput setaf 4)\]$(host_info)\[$(tput setaf 1)\]\$(nnn_info)\$(env_info)\$(git_info)\[$(tput setaf 4)\]\w\$ \[$(tput setaf 7)\]"

HISTSIZE=-1
HISTFILESIZE=-1

bind 'set mark-symlinked-directories on'
