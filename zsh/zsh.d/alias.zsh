# $HOME/.zsh/aliases

###############################
# Alias configuration
#  expand aliases before completing
###############################
alias ls='ls -GFv'
alias lsal='ls -al'

###############################
# path priority
###############################
alias mvn='/usr/local/bin/mvn'
alias emacs='/usr/local/Cellar/emacs/24.3/Emacs.app/Contents/MacOS/Emacs'

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
alias e='subl'
alias diff='colordiff'
# global aliases
alias -g L='|less'
alias -g H='|head'
alias -g T='|tail'
alias -g G='|grep'
alias -g V='|vim -R -'
