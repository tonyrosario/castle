#!/bin/sh
# .bash_profile

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

export JAVA_HOME=$(/usr/libexec/java_home)
export ANT_HOME=~/java/apache-ant-1.9.7
: "${JAVA_HOME?Need to set JAVA_HOME}"

export PATH=${JAVA_HOME}/bin:${ANT_HOME}/bin:$PATH
export PATH="$HOME/.rbenv/bin:$PATH"
