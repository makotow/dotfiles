#=============================
#  functions
#=============================
function fish_user_key_bindings
  bind \cr 'peco_sync_select_history (commandline -b)'
  bind \cx\cr peco_recentd
end

function peco
  command peco --layout=bottom-up $argv
end

function exists
  type -aq $1
end

function peco_sync_select_history
  history_merge > /dev/null ^&1
  peco_select_history_without_timestamp $argv
end

function peco_select_history_without_timestamp
  if test (count $argv) = 0
    set peco_flags --layout=top-down
  else
    set peco_flags --layout=top-down --query "$argv"
  end

  history|peco $peco_flags|read foo

  if [ $foo ]
    commandline (string replace -r '(\d{4}/\d{2}/\d{2})\s+(\d{2}:\d{2}:\d{2})\s+(\w+)' '$3' $foo)
  else
    commandline ''
  end
end

function history_merge --on-event fish_preexec
  history merge > /dev/null ^&1
end

#=============
# environment
#=============
set -x PAGER "less"
set -x LESS "--LINE-NUMBERS --quit-if-one-screen --RAW-CONTROL-CHARS --no-init --LONG-PROMPT --ignore-case"
set -x LESSOPEN "| src-hilite-lesspipe.sh %s"
set -x MORE "-R"
set -x JAVA_HOME (/usr/libexec/java_home)
set -x LANG ja_JP.UTF-8
set -x EDITOR 'emacsclient'
set -x VISUAL 'emacsclient'
set -x HOMEBREW_CASK_OPTS "--appdir=/Applications"
set -x XDG_CONFIG_HOME $HOME/.config
set -x GOPATH $HOME/src/go
set -x GOROOT (go env GOROOT)

## path
set -x PATH /usr/local/bin/ $GOPATH/bin $JAVA_HOME/bin $HOME/bin $PATH
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

###############################
# Alias configuration
#  expand aliases before completing
###############################
alias ls 'ls -GF'
alias l  'ls'
alias lsal 'ls -al'
alias ll 'ls -al'
alias cp 'cp -i'
alias df 'df -h'
alias dir 'ls -l'
alias du 'du -h'
alias grep 'grep --color'
alias mv 'mv -i'
alias rm 'rm -i'
alias whence 'type -a'
alias where "command -v"
alias diff 'colordiff'

#=============================
# direnv
#=============================
eval (direnv hook $SHELL)

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
