[[ $- != *i* ]] && return

[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

alias :q="exit"
alias diff="diff --color=auto"
alias grep="grep --color=auto"
alias ls="ls --color=auto -h"
alias ll="ls -l"
alias la="ll -A"
alias n="nnn"
alias py="python"
alias rm="rm -i"
alias mnt="udiskie-mount"
alias umnt="udiskie-umount"
hash paru 2>/dev/null || alias paru="sudo pacman"

nnn_info() {
    local lvl="$NNNLVL"
    [[ -n "$lvl" ]] && lvl="(N$lvl) "
    echo "$lvl"
}
env_info() {
    [[ -n $VIRTUAL_ENV ]] && echo "($(basename $(dirname $VIRTUAL_ENV))/$(basename $VIRTUAL_ENV)) "
}
git_info() {
    local git_ref=$(git symbolic-ref --short HEAD 2>/dev/null)
    [[ -n "$git_ref" ]] || git_ref=$(git describe --tags --always 2>/dev/null)
    [[ -n "$git_ref" ]] && git_ref="($git_ref) "
    echo "$git_ref"
}
host_info() {
    local host="$SSH_CLIENT"
    [[ -n "$host" ]] && host="\u@\H "
    echo "$host"
}
VIRTUAL_ENV_DISABLE_PROMPT=true
PS1="\[$(tput setaf 4)\]$(host_info)\[$(tput setaf 1)\]\$(nnn_info)\$(env_info)\$(git_info)\[$(tput setaf 4)\]\w\$ \[$(tput setaf 7)\]"
