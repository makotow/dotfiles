
###############################
# Alias configuration
#  expand aliases before completing
###############################

if cmd_exists eza; then
  alias e='eza --icons'
  alias l=e          
  alias ls=e
  alias ea='eza -a --icons'
  alias la=ea
  alias ee='eza -aal --icons'
  alias ll=ee
fi

alias lsal='ls -al'
alias ll='ls -al'

###############################
# cover mistype
###############################
alias ,,='cd ../'
alias //_='cd ../'
alias ...='cd ../'

# aliases for all shells
alias cp='cp -i'
alias df='df -h'
alias dir='ls -l'
alias du='du -h'
alias grep='grep --color'
alias j="jobs -l"
alias jobs='jobs -l'
alias mv='mv -i'
alias rm='rm -i'
alias whence='type -a'
alias where="command -v"
alias diff='colordiff'

# alias for git
alias g='git'
alias t='tig'
alias ta='tig --all'

# global aliases
alias -g L='|less'
alias -g H='|head'
alias -g T='|tail'
alias -g G='|grep'
alias -g V='|vim -R -'
alias -g X='|xargs'
