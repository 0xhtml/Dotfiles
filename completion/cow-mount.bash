#!/bin/bash

_cow-mount_completions() {
    case $COMP_CWORD in
        1)
            COMPREPLY=( $(compgen -f -X '!*.qcow2' -- ${COMP_WORDS[1]}) )
            COMPREPLY+=( $(compgen -d -- ${COMP_WORDS[1]}) )
            ;;
        2)
            COMPREPLY=( $(compgen -d -- ${COMP_WORDS[2]}) )
            ;;
    esac
}
complete -o filenames -F _cow-mount_completions cow-mount

_cow-umount_completions() {
    case $COMP_CWORD in
        1)
            COMPREPLY=( $(compgen -d -- ${COMP_WORDS[1]}) )
            ;;
    esac
}
complete -o filenames -F _cow-umount_completions cow-umount
