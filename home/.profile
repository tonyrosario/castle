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

#IR_BLACK colors
export CLICOLOR=1;

# Git branch in prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="[trosario] \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

# Git checkout with parameter
gitcheckout() {
    git checkout $1
}
alias gc=gitcheckout


# Git branch with parameter
gitbranch() {
    git checkout -b $1
}
alias gb=gitbranch



### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"


function brew {
  brew_cmd=`which brew`
  if [ "$1" == "install" ] || [ "$1" == "upgrade" ]; then
      $brew_cmd update
      $brew_cmd "$@"
      $brew_cmd cleanup
      export_brewed_apps
  else
    $brew_cmd "$@"
    if [[ "$1" == "uninstall" ]]; then
      export_brewed_apps
    fi
  fi
}
function export_brewed_apps {
  brew list | while read app; do echo "$app"; done > ~/.brewed_apps
}

