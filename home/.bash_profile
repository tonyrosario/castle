# Editors
export EDITOR="subl -n"
export BUNDLER_EDITOR="subl -n"

# Aliases
alias q="exit"
alias tree="tree --dirsfirst -lFC"
alias grep="grep --color=auto"
alias s="cd ~/Sites"
alias be="bundle exec"
alias rst='touch tmp/restart.txt && echo "Restarted."'
alias tlog="tail -f log/development.log"
alias cuke="be rake cucumber"
alias rspc="be rake spec"
alias memz="top -o vsize"
alias cpu="top -o cpu"
alias fml="be foreman start -f Procfile.local"
alias dev="cd ~/Development"
alias rb="dev && cd ruby"
alias js="dev && cd javascript"
alias resetter="rm -rf tmp/* && rm -rf log/* && rm -rf public/uploads/* && rake db:reset && rake db:test:prepare"
alias binstall="bundle install --binstubs .bundle/bin"
alias gemstrap="gem install bundler scss-lint rubocop haml"

# Rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Bash Completion
if [ -f /usr/local/etc/bash_completion ]; then
  source /usr/local/etc/bash_completion
fi

if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
  source /usr/local/etc/bash_completion.d/git-completion.bash
fi

# Bash Prompt
if [ -f ~/.bash_prompt ]; then
  source ~/.bash_prompt
fi

# Terminal
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Node.js
source /usr/local/opt/node/lib/node_modules/npm/lib/utils/completion.sh

# Vagrant
ulimit -n 4048
