[[ $- != *i* ]] && return

[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh
for f in ~/GitHub/Dotfiles/completion/*.bash; do source $f; done

alias :q="exit"
alias diff="diff --color=auto"
alias grep="grep --color=auto"
alias ls="ls --color=auto -h"
alias ll="ls -l"
alias la="ll -A"
alias du="du -h"
alias df="df -h"
alias free="free -h"
alias n="nnn"
alias py="python"
alias rm="echo 'Use trash instead of rm' && false"
alias mv="mv -i"
alias mnt="udiskie-mount"
alias umnt="udiskie-umount"
alias rstenv="deactivate && rm -rf env && python -m venv env && . env/bin/activate"
alias o="mimeopen "
alias xdg-open="mimeopen "

sudodiff() {
    EDITOR="vimdiff '$1.pacnew'" sudoedit "$1"
}

trash-size() {
    trash-list --trash-dirs | xargs du -hd0
}

nnn_info() {
    [[ -n $NNNLVL ]] && echo "(N$NNNLVL) "
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
    [[ -n $SSH_CLIENT ]] && echo "\u@\H "
}
VIRTUAL_ENV_DISABLE_PROMPT=true
PS1="\[$(tput setaf 4)\]$(host_info)\[$(tput setaf 1)\]\$(nnn_info)\$(env_info)\$(git_info)\[$(tput setaf 4)\]\w\$ \[$(tput setaf 7)\]"

HISTSIZE=-1
HISTFILESIZE=-1

bind 'set mark-symlinked-directories on'
