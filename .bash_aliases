alias a="xdg-open"
alias sudo='sudo env PATH=$PATH'
alias sudds='/usr/bin/sudo -s'
alias emacs="emacs -nw"
alias tree="tree -C"

export PATH=$HOME/bin/:$PATH:/home/moot/Documents/install/matlab2/bin/

# Less Colors for Man Pages

export LESS_TERMCAP_mb=$'\E[0;05;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;34m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[01;31m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[23;35m' # begin underline

export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64/
#export PATH=$PATH:$JAVA_HOME/bin
export PATH=$PATH:$HOME/opt/sbt/bin/
export JBOSS_HOME=/home/moot/opt/jboss/
export CLASSPATH=$CLASSPATH:/usr/share/java/log4j-1.2.jar
export PIGDIR=~/opt/pig/
export HADOOP_HOME=~/opt/hadoop/
#export JBOSS_HOME=~/usr/jboss/

alias ..="cd .."

alias mmount="udisks --mount"
alias unmmount="udisks --unmount"

alias eclipse="eclipse -vmargs -Xmx2048M"

save()
{
	[ "x$1" = "x" ] && echo "need a parameter" && exit 0
	for i in ~/*;do rsync -auv $i $1/ ;done
}

bck()
{
	[ "x$1" = "x" ] && echo "need a parameter" && exit 0
	for i in $1/*;do rsync -auv $i ~/ ;done
}
