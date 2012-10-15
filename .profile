# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
synclient TapButton3=3 TapButton2=2
_byobu_sourced=1 . /usr/bin/byobu-launch

source /home/moot/.rvm/scripts/rvm


export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64/
export CLASSPATH=$CLASSPATH:/usr/share/java/log4j-1.2.jar
export JBOSS_HOME=/home/moot/opt/jboss/
export HADOOP_HOME=~/opt/hadoop/
export PIGDIR=~/opt/pig/

export PATH=$PATH:$HOME/opt/sbt/bin/
export PATH=$HOME/bin/:$PATH
#:/home/moot/Documents/install/matlab2/bin/

export PATH=$(perl ~/usr/cope/cope_path.pl):$PATH


