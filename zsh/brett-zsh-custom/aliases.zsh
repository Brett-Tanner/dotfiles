# General
alias dot='cd ~/dotfiles && nvim .'
alias ls='lsd -l'

# Git
alias gac='git add -A && git commit -m'
alias glo='git log --oneline'
alias gp='git pull'
alias gps='git push'
alias gs='git status'

# Rails
alias bd='bin/dev'
alias rc='bundle exec rails console'
alias reb='bundle exec rails eb:deploy'
alias rdm='bundle exec rails db:migrate'
alias rdrs='bundle exec rails db:reset'
alias rgen='bundle exec rails generate'
alias rgm='bundle exec rails generate migration'
alias rr='bundle exec rails routes'
alias rrg='bundle exec rails routes --grep'
alias rs='bundle exec rails server'
alias rsp='bundle exec rspec'
