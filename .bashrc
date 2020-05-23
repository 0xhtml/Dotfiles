[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias to-mov="mkdir -p orig && ffmpeg -i '\$1' -c:v dnxhd -b:v 90M -c:a pcm_s16le '\$1.mov' && mv     '\$1' orig/."
alias to-mp4="mkdir -p orig && ffmpeg -i '\$1' -c:v libx264 -c:a aac '\$1.mp4' && mv '\$1' orig/."
alias lapdf="ne=${1%\.*} && pdflatex '${ne}.tex' && pdflatex '${ne}.tex' && rm '${ne}.aux' '${ne}.    log' '${ne}.toc'"
alias source="source '$1' 2>/dev/null || source env/bin/activate 2>/dev/null || source '$1'"

export BUP_DIR=/hdd/bup

PS1='[\u@\h \W]\$ '
