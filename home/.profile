export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export MYSQL_HOME=/usr/local/mysql
export M3_HOME="/usr/local/Cellar/maven/3.2.1/libexec/bin"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_55.jdk/Contents/Home"
export PATH="$JAVA_HOME/bin:$PATH"
eval "$(rbenv init -)"


HISTSIZE=1500
HISTFILESIZE=2500

if [ -f ~/.aliases ]
  then
   source ~/.aliases
fi

if [ -f ~/.api-keys ]
  then
   source ~/.api-keys
fi

if [ -f ~/.bash_functions ]
  then
   source ~/.bash_functions
fi

#IR_BLACK colors
export CLICOLOR=1;

# Git branch in prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="[trosario] \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

