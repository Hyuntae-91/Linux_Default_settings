#! /bin/bash

clear
echo "========================================"
echo "== Installing dev-env ... Please wait =="
echo "========================================"

echo ""
echo "Installing Python3...."
echo `brew install python -y 1>> log.log`
echo `curl https://bootstrap.pypa.io/get-pip.py > get-pip.py 1>> log.log`
echo `sudo python get-pip.py 1>> log.log`
echo `sudo rm -rf get-pip.py 1>> log.log`

echo ""
echo "Installing NeoVim...."
echo `pip install --upgrade pip 1>> log.log`
echo `pip install --user neovim 1>> log.log`
echo `pip3 install --user neovim 1>> log.log`
echo `brew install neovim -y 1>> log.log`

echo ""
echo "Installing tmux...."
echo `brew install tmux -y 1>> log.log`

echo ""
echo "Installing zsh...."
echo `brew install zsh -y 1>> log.log`

echo ""
echo "Installing clang...."
echo `brew install llvm 1>> log.log`

echo ""
echo "Installing NeoVim Plugin...."
echo `cp $PWD/setting_files/.vimrc $HOME/.vimrc 1>> log.log`
echo `mkdir -p $HOME/.config/nvim 1>> log.log`
echo `ln -s $HOME/.vimrc $HOME/.config/nvim/init.vim 1>> log.log`
echo `cp -R $PWD/setting_files/colors $HOME/.config/nvim/ 1>> log.log` 
echo `ln -s $HOME/.vim/colors/ $HOME/.config/nvim/colors/ 1>> log.log`
echo `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim 1>> log.log`
echo `nvim -c 'PluginInstall' -c 'qa!'`
echo `nvim -c 'UpdateRemotePlugins' -c 'qa!'`
echo `cp $PWD/setting_files/python.snippets $HOME/.vim/bundle/vim-snippets/snippets/ 1>> log.log`

echo ""
echo "Installing Oh-My-Zsh..."
echo `sudo curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh`

echo ""
echo "Copying Configuring files..."
echo `cp $PWD/setting_files/.bashrc $HOME 1>> log.log`
echo `cp $PWD/setting_files/.zshrc $HOME 1>> log.log`
echo `cp $PWD/setting_files/.tmux.conf $HOME 1>> log.log`
echo `cp $PWD/setting_files/agnoster.zsh-theme $HOME/.oh-my-zsh/themes/ 1>> log.log`
echo `cp $PWD/setting_files/tmux.plugin.zsh $HOME/.oh-my-zsh/plugins/tmux 1>> log.log`

ZSH_LOC="`which zsh`"
echo `sudo chsh -s $ZSH_LOC`
