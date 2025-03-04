
#=============
# environment
#=============
bindkey -e
export PAGER='less'
export LESS='-N -R -X -i --no-init --LONG-PROMPT --ignore-case'
export MORE='-R'
export LV='-la -Ou8 -c'
export LANG=ja_JP.UTF-8
export EDITOR='vi'
export VISUAL='vi'
export HISTFILE=${HOME}/.zsh_history # 履歴ファイルの保存先
export HISTSIZE=10000 # メモリに保存される履歴の件数
export SAVEHIST=100000 # 履歴ファイルに保存される履歴の件数
export XDG_CONFIG_HOME=${HOME}/.config
export XDG_DATA_HOME=${HOME}/.local/share
export XDG_CACHE_HOME=${HOME}/.cache
export XDG_STATE_HOME=${HOME}/.local/state

# for rootless docker
#export DOCKER_HOST=unix:///run/user/1000/docker.sock
# lsコマンド時、自動で色がつく(ls -Gのようなもの？)
export CLICOLOR=true

# version manager related 
export RBENV_ROOT=/usr/local/opt/rbenv
export PYENV_ROOT="$HOME/.pyenv"
export ZSH_CACHE_DIR=/tmp

### rehash immediately
zstyle ':completion:*:commands' rehash 1

### 補完方法毎にグループ化する。
zstyle ':completion:*' format '%B%F{blue}%d%f%b'
zstyle ':completion:*' group-name ''
### 補完侯補をメニューから選択する。
### select=2: 補完候補を一覧から選択する。補完候補が2つ以上なければすぐに補完する。
zstyle ':completion:*:default' menu select=1

### 補完候補に色を付ける。
#zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

### 補完候補がなければより曖昧に候補を探す
### m:{a-z}={A-Z}: 小文字を大文字に変えたものでも補完する。
### r:|[._-]=*: 「.」「_」「-」の前にワイルドカード「*」があるものとして補完する。
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} r:|[._-]=*'
zstyle ':completion:*' keep-prefix
zstyle ':completion:*' recent-dirs-insert both

#zstyle ':completion:*' completer _oldlist _complete _match _history _ignored _approximate _prefix
zstyle ':completion:*' completer _complete _history _ignored

## 補完候補をキャッシュする。
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path ${ZDOTDIR}/cache

## options: utility
setopt always_last_prompt  # 無駄なスクロールを避ける
setopt append_history  # 複数の zsh を同時に使う時など history ファイルに上書きせず追加
setopt auto_cd # ディレクトリ名だけでcd
setopt auto_list  # 補完候補が複数ある時に、一覧表示
setopt auto_menu  # 補完候補が複数あるときに自動的に一覧表示する
setopt auto_pushd # cd - で候補選択
setopt autoremoveslash
setopt complete_aliases # completion の時も
setopt complete_in_word  # カーソル位置で補完する。
setopt equals # =command を command のパス名に展開する
setopt extended_glob  # 拡張globを有効にする。
setopt extended_history  # 履歴ファイルに時刻を記録
setopt glob
setopt glob_complete  # globを展開しないで候補の一覧から補完する。
setopt hist_expand # 補完時にヒストリを自動的に展開
setopt hist_ignore_all_dups # ヒストリに重複を残さない、同じコマンドの場合古いのは消す
setopt hist_ignore_dups   # 直前と同じコマンドラインはヒストリに追加しない
setopt hist_no_store # history コマンドをヒストリリストから取り除く
setopt hist_reduce_blanks # 余分なスペースを削除してひすとりに追加
setopt hist_verify # ヒストリを呼び出してから実行する間に編集可能に
setopt ignoreeof       # ^Dでログアウトしない
setopt inc_append_history # 履歴をインクリメンタルに追加
setopt list_packed # 補完結果をなるべくつめる
setopt list_types # 補完候補一覧でファイルの種別を識別マーク表示
setopt magic_equal_subst  # コマンドライン引数の --prefix=/usr とか=以降でも補完
setopt mark_dirs   # globでパスを生成したときに、パスがディレクトリだったら最後に「/」をつける。
setopt no_beep  # 補完候補がないときなどにビープ音を鳴らさない。
setopt no_flow_control # Ctrl+S, Ctrl+Qによる制御を無効に
setopt no_nomatch # git show HEAD^とかrake foo[bar]とか使いたい
setopt numeric_glob_sort  # 辞書順ではなく数字順に並べる。
setopt print_eight_bit # 日本語ファイル名を表示可能に
setopt prompt_subst  # PROMPT内で変数展開・コマンド置換・算術演算を実行
setopt pushd_ignore_dups # 同じディレクトリをpushしない
setopt share_history  # シェルのプロセスごとに履歴を共有
setopt transient_rprompt  # コマンド実行後は右プロンプトを消す
unsetopt list_beep

# 3秒以上かかった処理は詳細表示
REPORTTIME=3

#==========================
# Prompt
#==========================
autoload -U promptinit
autoload -U colors && colors

# Googleカラーでサジェスト #
setopt correct
SPROMPT=" ＜ %{$fg[blue]%}も%{${reset_color}%}%{$fg[red]%}し%{${reset_color}%}%{$fg[yellow]%}か%{${reset_color}%}%{$fg[green]%}し%{${reset_color}%}%{$fg[red]%}て%{${reset_color}%}: %{$fg[red]%}%r%{${reset_color}%}？ [(y)es,(n)o,(a)bort,(e)dit]
❯"
## path
BREW_PREFIX='/opt/homebrew'
path=(
  $BREW_PREFIX/bin(N-/)     
#  $BREW_PREFIX/opt/coreutils/libexec/gnubin(N-/)
  $JAVA_HOME/bin(N-/)
  /usr/local/bin(N-/)
  /usr/local/sbin(N-/)
  $HOME/bin(N-/)
  $GOPATH/bin(N-/)
  $GOROOT/bin(N-/)
  $HOME/.cargo/bin(N-/)
  ${KREW_ROOT:-$HOME/.krew}/bin(N-/)
  $HOME/.local/bin(N-/)
  $PYENV_ROOT/shims(N-/)
  /usr/lib/dart/bin(N-/)
  $BREW_PREFIX/opt/fzf/bin(N-/)
  $HOME/.rd/bin(N-/)
  $HOME/.pub-cache/bin(N-/)
  #/opt/homebrew/opt/openjdk/bin(N-/)
  $HOME/.jenv/bin(N-/)
  $path
)

# fpath / completion
fpath=(
  /usr/local/share/zsh-completions(N-/) \
  /usr/local/share/zsh/site-functions(N-/) \
  $BREW_PREFIX/share/zsh/site-functions(N-/) \
  $fpath
)

#=============================#
# version manager
#=============================#

# mise 
eval "$($BREW_PREFIX/bin/mise activate zsh)"

# python version manager
if cmd_exists pyenv; then 
  eval "$(pyenv init -)";    
fi

# rust 
source_if_exists "$HOME/.cargo/env" 

# golang
if cmd_exists go; then
  export GOPATH=$HOME/.go
  export GOROOT=$(go env GOROOT)
  export GO111MODULE=on # Go 1.11 から利用可能
  export GOBIN=$HOME/bin
  export GOMODCACHE=$HOME/.cache/go_mod # Go 1.15 から利用可能
fi

# direnv
if cmd_exists direnv; then 
  eval "$(direnv hook zsh)";
fi

# kubectl completion
if cmd_exists kubectl; then
  source <(kubectl completion zsh)
fi

# jenv config 
if cmd_exists jenv; then
  eval "$(jenv init -)"
  jenv enable-plugin export
fi

# fzf config

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

## Auto-completion

[[ $- == *i* ]] && include "$BREW_PREFIX/opt/fzf/shell/completion.zsh" 2> /dev/null

## Key bindings

source_if_exists "$BREW_PREFIX/opt/fzf/shell/key-bindings.zsh"

# gcloud

## gcloud command completion
source_if_exists "$BREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

# zoxide 
if cmd_exists zoxide; then
  eval "$(zoxide init zsh)"
fi

# broot
source_if_exists "$XDG_CONFIG_HOME/broot/launcher/bash/br"


# ghq
function ghq-fzf() {
  local src=$(ghq list | fzf --preview "bat --color=always --style=header,grid --line-range :80 $(ghq root)/{}/README.*")
  if [ -n "$src" ]; then
    BUFFER="cd $(ghq root)/$src"
    zle accept-line
  fi
  zle -R -c
}
zle -N ghq-fzf
bindkey '^b' ghq-fzf