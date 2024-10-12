#!/bin/sh

# エイリアス作成
echo "alias vi='nvim'" >> ~/.bash_profile
source ~/.bash_profile

# シンボリック作成
ln -sf ~/dotfiles/vim/.vimrc ~/.vimrc
ln -sf ~/dotfiles/nvim ~/.config/nvim

# 拡張機能用ディレクトリ作成
mkdir ~/.vim/dein
mkdir -p ~/.config/coc/extensions
