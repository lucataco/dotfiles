# General Aliases
alias ns='npm start'
alias nr='npm run'
alias ll='ls -al'
alias cs='clear'
alias pg_start='brew services start postgresql'
alias pg_stop='brew services stop postgresql'
alias dev='cd ~/dev/'
alias sand='cd ~/dev/Sandbox'


# Git Aliases
alias ga='git add'
alias gaa='git add .'
alias gc='git commit'
alias gcm='git commit -m'
alias gd='git diff'
alias gi='git init'
alias gl='git log'
alias gp='git pull'
alias gpsh='git push'
alias gss='git status -s'
alias gs='echo ""; echo "***"; echo -e "   DONT FORGET TO PULL BEFORE COMMITTING"; echo "***"; echo ""; git status'


# Docker Aliases
alias doc='docker'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias dlsi='docker images'
alias drmi='docker rmi'
alias drmc='docker container rm'
alias docshell="docker run --rm -i -t --entrypoint=/bin/bash"
alias docshellsh="docker run --rm -i -t --entrypoint=/bin/sh"
function docshellhere() {
    dirname=${PWD##*/}
    docker run --rm -it --entrypoint=/bin/bash -v `pwd`:/${dirname} -w /${dirname} "$@"
}
function docshellshhere() {
    dirname=${PWD##*/}
    docker run --rm -it --entrypoint=/bin/sh -v `pwd`:/${dirname} -w /${dirname} "$@"
}
