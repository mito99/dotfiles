#!/bin/bash

# 1. スクリプトの絶対パスを取得（どこから実行してもOKなようにする）
DOT_DIR=$(cd $(dirname $0); pwd)

echo "--- Starting dotfiles setup ---"

# 2. Homebrew パッケージのインストール
if type brew &>/dev/null; then
    echo "[Brew] Installing packages from Brewfile..."
    brew bundle --file="$DOT_DIR/brew/Brewfile"
else
    echo "[Skip] Homebrew is not installed. Please install Homebrew first."
fi

# 3. zsh の設定（シンボリックリンク作成）
echo "[zsh] Linking .zshrc and .zshrc.d..."
ln -sf "$DOT_DIR/zsh/.zshrc" "$HOME/.zshrc"
# ~/.zshrc.d が「ディレクトリ」として存在している場合は一旦削除（リンクに置き換えるため）
if [ -d "$HOME/.zshrc.d" ] && [ ! -L "$HOME/.zshrc.d" ]; then
    rm -rf "$HOME/.zshrc.d"
fi
ln -sfn "$DOT_DIR/zsh/.zshrc.d" "$HOME/.zshrc.d"

# 4. Neovim の設定（シンボリックリンク作成）
echo "[nvim] Linking init.lua..."
mkdir -p "$HOME/.config/nvim"
ln -sf "$DOT_DIR/nvim/init.lua" "$HOME/.config/nvim/init.lua"

# 5. Git の 設定
echo "[git] Linking .gitconfig..."
ln -sf "$DOT_DIR/git/.gitconfig" "$HOME/.gitconfig"

echo "--- Setup Completed! ---"
echo "Please run 'source ~/.zshrc' to reflect changes."
