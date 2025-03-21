# General
abbr -a dot 'cd ~/dotfiles && nvim .'
abbr -a ls 'lsd -l'
abbr -a gcon 'nvim $HOME/Library/Application\ Support/com.mitchellh.ghostty/config'

# Git
abbr -a gac 'git add -A && git commit -m'
abbr -a gc 'git checkout'
abbr -a glo 'git log --oneline'
abbr -a gp 'git pull'
abbr -a gps 'git push'
abbr -a gs 'git status'

# Rails
abbr -a bd 'bin/dev'
abbr -a rc 'bundle exec rails console'
abbr -a reb 'bundle exec rails eb:deploy'
abbr -a rdm 'bundle exec rails db:migrate'
abbr -a rgen 'bundle exec rails generate'
abbr -a rgm 'bundle exec rails generate migration'
abbr -a rr 'bundle exec rails routes'
abbr -a rrg 'bundle exec rails routes --grep'
abbr -a rs 'bundle exec rails server'
abbr -a rsp 'bundle exec rspec'

# Node
abbr -a npd 'npm run dev'
abbr -a npt 'npm run test'
