$ #!/bin/sh
$ echo "alias vi='nvim'" >> ~/.bash_profile
$ source ~/.bash_profile
$ ln -sf ~/dotfiles/vim/.vimrc ~/.vimrc
$ ln -sf ~/dotfiles/nvim ~/.config/nvim
