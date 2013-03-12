# Editors
export EDITOR='subl -n'
export BUNDLER_EDITOR='subl -n'

# Aliases
alias grep='grep --color=auto'
alias s='cd ~/Sites'
alias be='bundle exec'
alias rst='touch tmp/restart.txt && echo "Restarted."'
alias tlog='tail -f log/development.log'
alias cuke='be rake cucumber'
alias rspc='be rake spec'
alias memz='top -o vsize'
alias cpu='top -o cpu'
alias fml='be foreman start -f Procfile.local'

# Rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Bash Completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
  source `brew --prefix`/etc/bash_completion
fi

if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
  source `brew --prefix`/etc/bash_completion.d/git-completion.bash
fi

# Bash Prompt
if [ -f ~/.bash_prompt ]; then
  source ~/.bash_prompt
fi

# Terminal
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Node.js
export NODE_PATH='/usr/local/lib/node'
export PATH="/usr/local/share/npm/bin:$PATH"

# Ruby Tuning
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
