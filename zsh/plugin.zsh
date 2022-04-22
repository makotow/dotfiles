### Added by Zinit's installer

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "${ZINIT_HOME}" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust
### End of Zinit's installer chunk

#=============================
# zinit
#=============================

zinit snippet 'OMZ::lib/clipboard.zsh'
zinit snippet 'OMZ::lib/completion.zsh'
zinit snippet 'OMZ::lib/compfix.zsh'

# zinit: Plugins {{{

# djui/alias-tips {{{
export ZSH_PLUGINS_ALIAS_TIPS_TEXT='alias-tips: '
# }}}

# Two regular plugins loaded without tracking.
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting
# Plugin history-search-multi-word loaded with tracking.
zinit load zdharma-continuum/history-search-multi-word
# Scripts that are built at install (there's single default make target, "install",
# and it constructs scripts by `cat'ing a few files). The make'' ice could also be:
# `make"install PREFIX=$ZPFX"`, if "install" wouldn't be the only, default target.
zinit ice as"program" pick"$ZPFX/bin/git-*" make"PREFIX=$ZPFX"
zinit light tj/git-extras
# For GNU ls (the binaries can be gls, gdircolors, e.g. on OS X when installing the
# coreutils package from Homebrew; you can also use https://github.com/ogham/exa)
zinit ice atclone"dircolors -b LS_COLORS > c.zsh" atpull'%atclone' pick"c.zsh" nocompile'!'
zinit light trapd00r/LS_COLORS
# 利用可能なエイリアスを使わずにコマンドを実行した際に通知するプラグインです。
zinit light 'djui/alias-tips'
# tmux のウィンドウを作業中のGitレポジトリ名に応じて自動的にリネームしてくれるプラグインです。(自分で作った)
zinit light 'sei40kr/zsh-tmux-rename'
# 作業ディレクトリに .env ファイルがあった場合に自動的にロードしてくれます。
zinit snippet 'OMZ::plugins/dotenv/dotenv.plugin.zsh'
# Gitの補完と大量のエイリアスを定義するプラグインです。
# エイリアスは重宝するものが多く、Gitを使うユーザーには必ずオススメしたいプラグインです。
zinit snippet 'OMZ::plugins/git/git.plugin.zsh'
# }}}
zinit light 'mollifier/anyframe'

# powerlevel 10k prompt
zinit ice depth=1; zinit light romkatv/powerlevel10k

# compinit
zinit cdreplay -q