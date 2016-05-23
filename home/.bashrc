# The individual per-interactive-shell startup file (interactive and non-login)
# Usage: aliases, configure PATH, set environment variables
# It should not output anything
# For more info: http://superuser.com/questions/789448/choosing-between-bashrc-profile-bash-profile-etc

if [ -f $HOME/.aliases ]; then
  source $HOME/.aliases
fi

# enable shims + autocomplete for jenv
if which jenv > /dev/null; then eval "$(jenv init -)"; fi

export EDITOR='subl -w'
export JAVA_HOME=$(/usr/libexec/java_home)
export ANT_HOME=$HOME/java/apache-ant-1.9.7
: "${JAVA_HOME?Need to set JAVA_HOME}"

export PATH=${JAVA_HOME}/bin:${ANT_HOME}/bin:$PATH
export PATH="$HOME/.rbenv/bin:$PATH"

export PATH="$(brew --prefix git)/bin:$PATH"