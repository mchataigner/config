# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'



alias less='less -R'
alias a="xdg-open"
# alias sudo='sudo env PATH=$PATH'
alias sudds='/usr/bin/sudo -s'
alias emacs="emacs -nw"
alias tree="tree -C"

alias synaptic="synclient TapButton2=2 && synclient TapButton3=3"

# Less Colors for Man Pages

export LESS_TERMCAP_mb=$'\E[0;05;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;34m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[01;31m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[23;35m' # begin underline

export LESSOPEN='|/usr/share/source-highlight/src-hilite-lesspipe.sh %s'

export PATH=$PATH:$HOME/opt/play/:$HOME/bin/

alias ..="cd .."

alias mmount="udisks --mount"
alias unmmount="udisks --unmount"

alias eclipse="eclipse -vmargs -Xmx2048M"

# save()
# {
# 	[ "x$1" = "x" ] && echo "need a parameter" && exit 0
# 	for i in ~/*;do rsync -auv $i $1/ ;done
# }

# bck()
# {
# 	[ "x$1" = "x" ] && echo "need a parameter" && exit 0
# 	for i in $1/*;do rsync -auv $i ~/ ;done
# }

