大学時代のMacでの設定

シェルスクリプトもっとちゃんと書こう
https://www.takameron.info/post/dotfiles/

# dotfiles
## vim/.vimrc
シンプルvimの設定（プラグインなし）

## nvim/
neovimの設定（dein coc init.vim）

## 初期設定(シンボリック作成)
`$ cd ~/`

`$ git clone https://github.com/ring-ring097/dotfiles.git`

エイリアス，シンボリック，必要なフォルダなどを用意

`$ sh ~/dotfiles/dotfilesLink.sh`

（zshの場合はdotfiles_z_Link.sh)

権限が必要になる場合は，
`$ shmod u+x ~/dotfiles/dotfilesLink.sh`

## homebrewとパッケージのインストール

参照：https://qiita.com/takeshisakuma/items/e9685fb9e394212247c0

## nvimのインストール 
`$ brew update`

`$ brew install neovim`

`$ nvim -version`

## python3のインストール
参照：https://kotaro7750.hatenablog.com/entry/nvim_venv

`$ brew install python3`

pythonのpath設定（init.nvim）

`let g:python3_host_prog = expand('which python3')`

`let g:python_host_prog = expand('which python2')`

`$ pip3 install -U neovim`

## nodeのインストール
`$ brew install nodebrew`

`$ nodebre setup`

`$ nodebrew install-binary stable`

`$ nodebrew ls`

`$ nodebrew use {version}`

`$ echo 'export PATH=$HOME/.nodebrew/current/bin:$PATH' >> ~/.bash_profile`

## yarnのインストール
`$ npm install -g yarn`


## dein.vimのインストール
`($ mkdir ~/.vim/dein)`

`$ cd ~/.vim/dein`

`$ curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh`

`$ sh ./installer.sh ~/.vim/dein`

**deinのsamplescriptsと見比べてpathを確認**

## coc.nvimの設定
`($ mkdir -p ~/.config/coc/extensions)`

`:call coc#util#install()`

`:CocList extensions`

    - "coc-css": ">=1.2.6",

    - "coc-dictionary": ">=1.2.2",
    
    - "coc-html": ">=1.4.1",
    
    - "coc-json": ">=1.3.3",
    
    - "coc-phpls": ">=2.2.0",
    
    - "coc-python": ">=1.2.13",
    
    - "coc-snippets": ">=2.4.2",
    
    - "coc-solargraph": ">=1.2.1",
    
    - "coc-tsserver": ">=1.6.7",
    
    - "coc-vimtex": ">=1.0.4",
    
    - "coc-word": ">=1.2.2",
    
    - "coc-yaml": ">=1.3.0"

## vim状態確認
`:checkhealth`

## Copilot
`:Copilot setup`
`:Copilot status`


## python バージョン管理
`$ brew install pyenv`

\~/.bash_profile または\~/.zshrc に以下を追加

	`export PYENV_ROOT="$HOME/.pyenv"`
	
	`export PATH="$PYENV_ROOT/bin:$PATH"`
	
	`eval "$(pyenv init -)"`

保存
`$ source ~/.bash_profile`

big sur で古いバージョンのpythonをインストールする

[参考](https://qiita.com/shimajiroxyz/items/788811730c152b18c997)

切り替え

`$ pyenv install (version) or (--list)`

`$ pyenv local or global (version)`

## python仮想環境(venv)
`$ python -m venv (name)`

`$ . (name)/bin/activate`

`$ pip install ~~~`

`$ deactivate`

## Ruby仮想環境(rbenv, bundler)

`$ deactivate`

[参考](https://yumegori.com/mac-gem-install20191106)
