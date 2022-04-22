
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/dotfiles/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
 source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


#==============================
# common utilities
#==============================

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path
typeset -U path PATH

#zmodload zsh/zpty

#=============================
# utlity
#==============================
function cmd_exists() { type -a $1 &> /dev/null; }

# {{ TODO: WIP 
function file_exists() { -e $1 &> /dev/null; }
#}}
