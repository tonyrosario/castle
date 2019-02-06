#!/bin/sh

if [ -f $HOME/.bashrc ]; then
  . $HOME/.bashrc
fi

# don't remember where this came from
# parse_git_branch() {
#      git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
# }
# export PS1="\u \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "*"
}
function parse_git_stash {
  [[ $(git stash list 2> /dev/null | tail -n1) != "" ]] && echo "^"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)$(parse_git_stash)/"
}
export PS1='\u \[\033[32m\]\w\[\033[33m\] \[\e[0;36m\]$(parse_git_branch)\[\e[m\] $ '

# \w - path to current directory
# \W - current directory
# \u - user
# \H - fully qualified host name
# \h - hostsource /Users/xtxr035/java/hybris-setup-grainger/devtools/hybris_aliases.sh
