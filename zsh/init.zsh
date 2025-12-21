#=============================
# Common utlities
#==============================

function source_if_exists() { 
  if [[ -r "$1" ]]; then
    source "$1"
  fi
}

function cmd_exists() { type -a $1 &> /dev/null; }

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/dotfiles/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

source_if_exists "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path
typeset -U path PATH

#zmodload zsh/zpty

autoload -Uz compinit && compinit