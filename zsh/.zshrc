#==============================
# common utilities
#==============================
## for performance
#zmodload zsh/zprof

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

zmodload zsh/zpty

#=============================
# utlity
#==============================
function exists() { type -a $1 &> /dev/null; }

#=============
# environment
#=============
bindkey -e
export PAGER='less'
export LESS='-N -R -X -i --no-init --LONG-PROMPT --ignore-case'
export MORE='-R'
export LV='-la -Ou8 -c'
#export JAVA_HOME=$(/usr/libexec/java_home)
export LANG=ja_JP.UTF-8
export EDITOR='vi'
export VISUAL='vi'
export HISTFILE=${HOME}/.zsh_history # 履歴ファイルの保存先
export HISTSIZE=10000 # メモリに保存される履歴の件数
export SAVEHIST=100000 # 履歴ファイルに保存される履歴の件数
export XDG_CONFIG_HOME=${HOME}/.config

# lsコマンド時、自動で色がつく(ls -Gのようなもの？)
export CLICOLOR=true

## completion
autoload -U compinit
compinit -u

### 補完方法毎にグループ化する。
zstyle ':completion:*' format '%B%F{blue}%d%f%b'
zstyle ':completion:*' group-name ''
### 補完侯補をメニューから選択する。
### select=2: 補完候補を一覧から選択する。補完候補が2つ以上なければすぐに補完する。
zstyle ':completion:*:default' menu select=1

### 補完候補に色を付ける。
#zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

### 補完候補がなければより曖昧に候補を探す。
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

# load .zshrc_*
[ -f $ZDOTDIR/.`uname`_zshrc  ] && . $ZDOTDIR/.`uname`_zshrc
[ -f $ZDOTDIR/.zshrc_external ] && . $ZDOTDIR/.zshrc_external
[ -f $ZDOTDIR/.zshrc_alias    ] && . $ZDOTDIR/.zshrc_alias
[ -f $ZDOTDIR/.zshrc_misc     ] && . $ZDOTDIR/.zshrc_misc
[ -f $ZDOTDIR/.zshrc_local    ] && . $ZDOTDIR/.zshrc_local

# Performance
# if type zprof > /dev/null 2>&1; then
# 	  zprof | less
# fi
