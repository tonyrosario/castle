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


## shim for homebrew - will update+doctor whenever you try to install or upgrade
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