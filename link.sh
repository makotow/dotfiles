#!/usr/bin/env bash

# ドットファイルのリポジトリのルートディレクトリを取得
DOTFILES_ROOT=$(pwd)

# リンクを作成する関数
# $1: リンク元のファイル (リポジトリ内)
# $2: リンク先のファイル (ホームディレクトリなど)
create_symlink() {
  local source_path="$1"
  local target_path="$2"

  # リンク先のディレクトリを作成
  mkdir -p "$(dirname "$target_path")"

  # リンク先が既に存在し、かつ、それが意図したシンボリックリンクでない場合
  if [ -e "$target_path" ] && [ "$(readlink "$target_path")" != "$source_path" ]; then
    echo "Backing up existing file: $target_path -> $target_path.bak"
    # 既存のファイルをバックアップ
    mv "$target_path" "$target_path.bak"
  fi

  # シンボリックリンクを作成
  ln -snf "$source_path" "$target_path"
  echo "Linked $target_path -> $source_path"
}

# 各設定ファイルに対してリンク作成関数を呼び出す
create_symlink "$DOTFILES_ROOT/zsh/zshenv" "$HOME/.zshenv"
create_symlink "$DOTFILES_ROOT/git/.gitconfig" "$HOME/.gitconfig"
create_symlink "$DOTFILES_ROOT/git/.gitignore_global" "$HOME/.gitignore_global"
create_symlink "$DOTFILES_ROOT/git/.tigrc" "$XDG_CONFIG_HOME/tig/.tigrc"
create_symlink "$DOTFILES_ROOT/tmux/tmux.conf" "$XDG_CONFIG_HOME/tmux/tmux.conf"

echo "✅ Symbolic links created successfully."