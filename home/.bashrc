# The individual per-interactive-shell startup file (interactive and non-login)
# Usage: aliases, configure PATH, set environment variables
# It should not output anything
# For more info: http://superuser.com/questions/789448/choosing-between-bashrc-profile-bash-profile-etc

if [ -f $HOME/.aliases ]; then
  source $HOME/.aliases
fi

# avoid checking in client-specific info
if [ -f $HOME/.client ]; then
  source $HOME/.client
fi

# enable shims + autocomplete for jenv
if which jenv > /dev/null; then eval "$(jenv init -)"; fi

#export EDITOR='subl -w'
#export EDITOR='atom -h'
# /Library/Java/JavaVirtualMachines/jdk1.7.0_80.jdk/Contents/Home/
export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
export JAVA_7_HOME=$(/usr/libexec/java_home -v1.7)

alias java7='export JAVA_HOME=$JAVA_7_HOME'
alias java8='export JAVA_HOME=$JAVA_8_HOME'

#default java8
export JAVA_HOME=$JAVA_8_HOME

export M2_HOME="/usr/local/Cellar/maven/3.6.0/"

export ANT_HOME=$HOME/java/apache-ant-1.9.7
: "${JAVA_HOME?Need to set JAVA_HOME}"

export PATH=${JAVA_HOME}/bin:${ANT_HOME}/bin:${M2_HOME}/bin:$PATH
export PATH="$HOME/.rbenv/bin:$PATH"

export PATH="$(brew --prefix git)/bin:$PATH"

# Need this because I installed brew before this upgrade to cask
# https://github.com/caskroom/homebrew-cask/issues/21913
export HOMEBREW_CASK_OPTS="--caskroom=/opt/homebrew-cask/Caskroom"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
