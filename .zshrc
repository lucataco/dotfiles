# ============================================================================
# Oh-My-Zsh
# ============================================================================
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git z zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# ============================================================================
# Environment
# ============================================================================
export LANG=en_US.UTF-8
export EDITOR=nvim
export VISUAL=nvim

# ============================================================================
# Prompt
# ============================================================================
PROMPT='%{$fg[green]%}%m '$PROMPT
RPROMPT="%{$fg[yellow]%}%D{%L:%M:%S}"

# ============================================================================
# NVM (lazy-loaded for fast startup)
# ============================================================================
export NVM_DIR="$HOME/.nvm"
_nvm_lazy_load() {
  unset -f nvm node npm npx
  [ -s "$(brew --prefix nvm)/nvm.sh" ] && source "$(brew --prefix nvm)/nvm.sh"
}
nvm()  { _nvm_lazy_load; nvm "$@"; }
node() { _nvm_lazy_load; node "$@"; }
npm()  { _nvm_lazy_load; npm "$@"; }
npx()  { _nvm_lazy_load; npx "$@"; }

# ============================================================================
# Conda
# ============================================================================
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

# ============================================================================
# Aliases — Editor
# ============================================================================
alias v="nvim"
alias vim="nvim"
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"

# ============================================================================
# Aliases — Modern CLI replacements
# ============================================================================
alias ls="eza --icons --group-directories-first"
alias ll="eza -la --icons --group-directories-first --git"
alias lt="eza -la --icons --tree --level=2"
alias cat="bat --paging=never"
alias grep="rg"
alias find="fd"
alias top="btop"

# ============================================================================
# Aliases — Docker
# ============================================================================
alias dps="docker ps"
alias dpsa="docker ps -a"
alias di="docker images"
alias drmi="docker rm"
alias dip="docker image prune"
alias dipa="docker image prune -a"
alias dsp="docker system prune"
alias dspa="docker system prune -a"

# ============================================================================
# Aliases — Git shortcuts
# ============================================================================
alias gs="git status"
alias gd="git diff"
alias gl="git log --oneline -20"
alias gp="git pull"

# ============================================================================
# Tool integrations
# ============================================================================
# fzf — fuzzy finder (Ctrl+R history, Ctrl+T files, Alt+C cd)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'

# thefuck — typo correction (type 'fuck' to fix last command)
eval $(thefuck --alias)



