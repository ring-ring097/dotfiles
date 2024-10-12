#!/bin/zsh

# エイリアス作成
echo "alias vi='nvim'" >> ~/.zprofile
source ~/.zprofile

# シンボリック作成
ln -sf ~/dotfiles/vim/.vimrc ~/.vimrc
ln -sf ~/dotfiles/nvim ~/.config/nvim

# 拡張機能用ディレクトリ作成
mkdir ~/.vim/dein
mkdir -p ~/.config/coc/extensions
