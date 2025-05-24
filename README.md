LY一年目

# dotfiles
## vim/.vimrc
シンプルvimの設定（プラグインなし）

## nvim/
neovimの設定（lazy.nvim + kickstart.nvim + coc.nvim）

## 初期設定(シンボリック作成)
`$ cd ~/`

`$ git clone https://github.com/ring-ring097/dotfiles.git`

エイリアス，シンボリック，必要なフォルダなどを用意

`$ sh ~/dotfiles/dotfilesLink.sh`

（zsh用)

権限が必要になる場合は，
`$ shmod u+x ~/dotfiles/dotfilesLink.sh`

## homebrewとパッケージのインストール

## nvimのインストール 

## python3のインストール

## node,npmのインストール

## dein.vimのインストール

## coc.nvimの設定
`($ mkdir -p ~/.config/coc/extensions)`

`:call coc#util#install()`

`:CocList extensions`

## vim状態確認
`:checkhealth`

## Copilot
`:Copilot setup`
`:Copilot status`

