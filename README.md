# dotfiles
## vim/.vimrc
シンプルvimの設定（プラグインなし）

## nvim/
neovimの設定（dein coc init.vim）

## 初期設定(シンボリック作成)
`$ cd ~/`

`$ git clone https://github.com/ring-ring097/dotfiles.git`

`$ sh ~/dotfiles/dotfilesLink.sh`

## nvimのインストール 
`$ brew update`

`$ brew install neovim`

`$ nvim -version`

## python3のインストール
参照：https://kotaro7750.hatenablog.com/entry/nvim_venv

`- $ brew install python3`

`- $ pip3 install -U neovim`


## dein.vimのインストール
`$ mkdir ~/.vim/dein`

`$ cd ~/.vim/dein`

`$ curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh`

`$ sh ./installer.sh ~/.vim/dein`

**deinのsamplescriptsと見比べてpathを確認**

##vim状態確認
`:checkhealth`


## python バージョン管理
`$ brew install pyenv`

~/.bash_profile または~/.zshrc 以下を追加
`
	export PYENV_ROOT="$HOME/.pyenv"
	export PATH="$PYENV_ROOT/bin:$PATH"
	eval "$(pyenv init -)"
`
`$ source ~/.bash_profile`

切り替え
`$ pyenv install (version) or (--list)`
`$ pyenv local or global (version)`

## python仮想環境(venv)
`$ python -m venv (name)`
`$ . (name)/bin/activate`

`$ pip install ~~~`

`$ deactivate`
