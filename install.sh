#!/bin/bash
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
mkdir -p /opt/apps
tar -C /opt/apps/ -xzf nvim-linux64.tar.gz 
sudo ln -s /opt/apps/nvim-linux64/bin/nvim /bin/nvim
sudo update-alternatives --install /usr/bin/editor editor /opt/apps/nvim-linux64/bin/nvim 1
sudo update-alternatives --install /usr/bin/vim vim /opt/apps/nvim-linux64/bin/nvim 1
sudo update-alternatives --install /usr/bin/vi vi /opt/apps/nvim-linux64/bin/nvim 1
sudo update-alternatives --config editor
sudo update-alternatives --config vim
sudo update-alternatives --config vi

sudo aptitude install luarocks ripgrep python3-neovim ruby gem ruby-dev fd-find tree-sitter-cli -y
sudo npm install -g neovim

sudo gem install neovim
gem environment
