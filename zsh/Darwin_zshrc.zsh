
export BROWSER='open'

#=============================
# homebrew
#=============================
eval "$(/opt/homebrew/bin/brew shellenv)"
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

#======================
# Env
#======================

## gcloud command completion
source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

#======================
# alias
#======================
alias ls='ls -GF --color=auto'