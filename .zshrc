export ZSH="/Users/lucataco/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git z)

source $ZSH/oh-my-zsh.sh

# Example aliases
alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"
alias dps="docker ps"
alias dpsa="docker ps -a"
alias di="docker images"
alias drmi="docker rm"
alias dip="docker image prune"
alias dipa="docker image prune -a"
alias dsp="docker system prune"
alias dspa="docker system prune -a"


# Timestamp Left
PROMPT='%{$fg[green]%}%m '$PROMPT

#Time Right
RPROMPT="%{$fg[yellow]%}%D{%L:%M:%S}"
