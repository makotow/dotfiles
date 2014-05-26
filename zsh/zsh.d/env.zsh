
export PAGER='less'
export LESS='-R -X -i'
#export LESSOPEN='| lesspipe.sh %s'
export LV='-la -Ou8 -c'
export JAVA_HOME=`/usr/libexec/java_home`
export LANG=ja_JP.UTF-8
export RBENV_ROOT=/usr/local/opt/rbenv

# 3秒以上かかった処理は詳細表示
REPORTTIME=3

#=============================
# source z.sh
#=============================
if which brew > /dev/null;then
   . `brew --prefix`/etc/profile.d/z.sh
fi

#=============================#
# command-line stack
#=============================#
show_buffer_stack() {
  POSTDISPLAY="
stack: $LBUFFER"
  zle push-line-or-edit
}
zle -N show_buffer_stack

if which rbenv > /dev/null;then
    eval "$(rbenv init - zsh)";
    . $RBENV_ROOT/completions/rbenv.zsh
fi


#=====================#
# powerline for zsh 
#=====================#
#export POWERLINE_REPOSITORY=$HOME/.vim/bundle/powerline 
#if [[ -r $POWERLINE_REPOSITORY/powerline/bindings/zsh/powerline.zsh ]]; then
#    . $POWERLINE_REPOSITORY/powerline/bindings/zsh/powerline.zsh
#fi
#
#

function do_enter() {
    if [ -n "$BUFFER" ]; then
        zle accept-line
        return 0
    fi
    echo
    ls
    # ↓おすすめ
    # ls_abbrev
    if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = 'true' ]; then
        echo
        echo -e "\e[0;33m--- git status ---\e[0m"
        git status -sb
    fi
    zle reset-prompt
    return 0
}
zle -N do_enter
bindkey '^m' do_enter

