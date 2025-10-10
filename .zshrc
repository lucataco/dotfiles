# Autocompletion
autoload -Uz compinit
compinit

# Path to your oh-my-zsh installation.
export ZSH="/Users/lucataco/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# plugins
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

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
RPROMPT="%{$fg[yellow]%}[%D{%L:%M:%S}]"


# NVM
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/lucataco/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/lucataco/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/lucataco/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/lucataco/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/lucataco/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/lucataco/Downloads/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/Users/lucataco/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/lucataco/Downloads/google-cloud-sdk/completion.zsh.inc'; fi


