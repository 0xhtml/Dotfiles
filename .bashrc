[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias updategrub="sudo sh -c 'grub-mkconfig | sed \"s/echo/#echo/g\" > /boot/grub/grub.cfg'"
alias n="nnn"

export BUP_DIR=/hdd/bup

git_info() {
    local git_ref=$(git symbolic-ref --short HEAD 2>/dev/null)
    [[ -n "$git_ref" ]] || git_ref=$(git describe --tags --always 2>/dev/null)
    [[ -n "$git_ref" ]] && git_ref="($git_ref) "
    echo "$git_ref"
}
env_info() {
    local env=$(basename "$VIRTUAL_ENV")
    [[ -n "$env" ]] && env="($env) "
    echo "$env"
}
VIRTUAL_ENV_DISABLE_PROMPT=true
PS1="\[$(tput setaf 1)\]\$(env_info)\$(git_info)\[$(tput setaf 3)\]\w$ \[$(tput setaf 15)\]"
