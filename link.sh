#!/usr/bin/env bash

# XDG Base Directory準拠のdotfilesセットアップスクリプト
# このリポジトリは ~/.config/dotfiles にクローンすることを想定

set -e

# 色付き出力
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# このスクリプトのディレクトリ（リポジトリのルート）
DOTFILES_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# XDG Base Directory のデフォルト値を設定
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

echo "🔧 Setting up XDG-compliant dotfiles..."
echo "   Repository: $DOTFILES_ROOT"
echo "   Config home: $XDG_CONFIG_HOME"
echo ""

# ディレクトリシンボリックリンクを作成する関数
# $1: リンク元のディレクトリ (リポジトリ内)
# $2: リンク先のディレクトリ
create_dir_symlink() {
  local source_dir="$1"
  local target_dir="$2"

  # リンク先の親ディレクトリを作成
  mkdir -p "$(dirname "$target_dir")"

  # リンク先が既に存在する場合
  if [ -e "$target_dir" ]; then
    # 既に正しいシンボリックリンクの場合はスキップ
    if [ -L "$target_dir" ] && [ "$(readlink "$target_dir")" = "$source_dir" ]; then
      echo -e "${GREEN}✓${NC} Already linked: $target_dir"
      return 0
    fi

    # 既存のファイル/ディレクトリをバックアップ
    echo -e "${YELLOW}⚠${NC}  Backing up existing: $target_dir -> $target_dir.bak"
    mv "$target_dir" "$target_dir.bak"
  fi

  # シンボリックリンクを作成
  ln -snf "$source_dir" "$target_dir"
  echo -e "${GREEN}✓${NC} Linked: $target_dir -> $source_dir"
}

# ファイルシンボリックリンクを作成する関数（.zshenvのみ）
create_file_symlink() {
  local source_file="$1"
  local target_file="$2"

  # リンク先の親ディレクトリを作成
  mkdir -p "$(dirname "$target_file")"

  # リンク先が既に存在する場合
  if [ -e "$target_file" ]; then
    # 既に正しいシンボリックリンクの場合はスキップ
    if [ -L "$target_file" ] && [ "$(readlink "$target_file")" = "$source_file" ]; then
      echo -e "${GREEN}✓${NC} Already linked: $target_file"
      return 0
    fi

    # 既存のファイルをバックアップ
    echo -e "${YELLOW}⚠${NC}  Backing up existing: $target_file -> $target_file.bak"
    mv "$target_file" "$target_file.bak"
  fi

  # シンボリックリンクを作成
  ln -snf "$source_file" "$target_file"
  echo -e "${GREEN}✓${NC} Linked: $target_file -> $source_file"
}

# XDG_CONFIG_HOME配下のディレクトリをリンク
echo "📁 Linking config directories..."
create_dir_symlink "$DOTFILES_ROOT/git" "$XDG_CONFIG_HOME/git"
create_dir_symlink "$DOTFILES_ROOT/tmux" "$XDG_CONFIG_HOME/tmux"
create_dir_symlink "$DOTFILES_ROOT/tig" "$XDG_CONFIG_HOME/tig"
create_dir_symlink "$DOTFILES_ROOT/zsh" "$XDG_CONFIG_HOME/zsh"
create_dir_symlink "$DOTFILES_ROOT/wezterm" "$XDG_CONFIG_HOME/wezterm"
create_dir_symlink "$DOTFILES_ROOT/nvim" "$XDG_CONFIG_HOME/nvim"


echo ""
echo "📄 Linking bootstrap files..."
# zshのブートストラップファイル（これだけはホームディレクトリ直下が必要）
create_file_symlink "$DOTFILES_ROOT/bootstrap/.zshenv" "$HOME/.zshenv"

echo ""
echo -e "${GREEN}✅ Setup complete!${NC}"
echo ""
echo "📝 Next steps:"
echo "   1. Restart your shell or run: source ~/.zshenv"
echo "   2. Your dotfiles are now XDG Base Directory compliant!"
echo ""
