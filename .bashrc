[[ $- != *i* ]] && return

if [[ -d ~/git/Dotfiles ]]; then DOTFILES=~/git/Dotfiles
elif [[ -d ~/GitHub/Dotfiles ]]; then DOTFILES=~/GitHub/Dotfiles
elif [[ -d ~/Dotfiles ]]; then DOTFILES=~/Dotfiles
else
    echo "Dotfiles not found"
    return
fi

MANPAGES=$(grep '_[^s].=' "${DOTFILES}/man-pages/manpages.zshrc")
eval "${MANPAGES}" && export GROFF_NO_SGR=1
unset MANPAGES

unset DOTFILES

[[ "${TERM}" == foot ]] && eval "$(dircolors -p | sed 's/TERM Eterm/TERM foot\n&/' | dircolors -)"

[[ -r /usr/share/z/z.sh ]] && . /usr/share/z/z.sh
[[ -r /usr/share/blesh/ble.sh ]] && . /usr/share/blesh/ble.sh

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
alias py="python"
hash trash 2>/dev/null && alias rm="echo 'Use trash instead of rm' && false"
alias mv="mv -i"
alias mnt="udiskie-mount"
alias umnt="udiskie-umount"
alias sudo="sudo "
alias watch="watch "
alias fd="fd --prune"
alias wget="curl -fLO"

_nnn_info() {
    [[ -n "${NNNLVL}" ]] && echo "(N${NNNLVL}) "
}
_env_info() {
    [[ -n "${VIRTUAL_ENV}" ]] && echo "($(basename "$(dirname "${VIRTUAL_ENV}")")/$(basename "${VIRTUAL_ENV}")) "
}
_git_info() {
    local git_ref
    git_ref=$(git symbolic-ref --short HEAD 2>/dev/null)
    [[ -n "${git_ref}" ]] || git_ref=$(git describe --tags --always 2>/dev/null)
    [[ -n "${git_ref}" ]] && echo "(${git_ref}) "
}
_host_info() {
    [[ -n "${SSH_CLIENT}" ]] && echo "\u@\H "
}
VIRTUAL_ENV_DISABLE_PROMPT=true
PS1="\[$(tput setaf 4)\]$(_host_info)\[$(tput setaf 1)\]\$(_nnn_info)\$(_env_info)\$(_git_info)\[$(tput setaf 4)\]\w\$ \[$(tput setaf 7)\]"

_osc7_cwd() {
    local strlen=${#PWD}
    local encoded=""
    local pos c o
    for (( pos=0; pos<strlen; pos++ )); do
        c=${PWD:$pos:1}
        case "$c" in
            [-/:_.!\'\(\)~[:alnum:]] ) o="${c}" ;;
            * ) printf -v o '%%%02X' "'${c}" ;;
        esac
        encoded+="${o}"
    done
    printf '\e]7;file://%s%s\e\\' "${HOSTNAME}" "${encoded}"
}
[[ "${TERM}" == foot ]] && PROMPT_COMMAND="${PROMPT_COMMAND:+${PROMPT_COMMAND%;}; }_osc7_cwd"

HISTSIZE=-1
HISTFILESIZE=-1

bind 'set mark-symlinked-directories on'
bind 'set match-hidden-files off'
bind 'set show-all-if-ambiguous on'
