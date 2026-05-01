#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias lg='lazygit'
PS1='[\u@\h \W]\$ '

# CLI Productivity
eval "$(zoxide init bash)"
eval "$(direnv hook bash)"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Advanced Aliases
# Git
alias gs='git status'
alias ga='git add -A'
alias gc='git commit -m'
alias gp='git push'
alias gl='git log --oneline --graph --decorate'

# Docker / Podman (compat)
alias dco='docker-compose'
alias dps='docker ps'
alias di='docker images'

# System Maintenance
alias update='paru -Syu'
alias sysclean='paru -Sc && paru -Rns $(paru -Qdtq)'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"

. "$HOME/.cargo/env"

[[ -f ~/.bashrc.local ]] && source ~/.bashrc.local
