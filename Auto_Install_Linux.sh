#! /bin/bash

if [ $UID == 0 ];
then
    echo "Do not use 'sudo' command ! !"
    exit 1
fi

clear
echo "========================================"
echo "== Installing dev-env ... Please wait =="
echo "========================================"

echo ""
echo "Installing curl...."
echo `sudo apt-get install curl -y 1>> log.log`

echo ""
echo "Installing Python2...."
echo `sudo apt-get install python -y 1>> log.log`
echo ""
echo "Installing Python3...."
echo `sudo apt-get install python3 -y 1>> log.log`

echo ""
echo "Installing NeoVim...."
echo `sudo apt-get install software-properties-common -y 1>> log.log`
echo `sudo apt-get install python-dev python-pip python3-dev python3-pip -y 1>> log.log`
echo `sudo add-apt-repository ppa:neovim-ppa/unstable -y 1>> log.log`
echo `sudo apt-get update -y 1>> log.log`
echo `pip2 install --user neovim 1>> log.log`
echo `pip3 install --user neovim 1>> log.log`
echo `sudo apt-get install neovim -y 1>> log.log`

echo ""
echo "Installing tmux...."
echo `sudo apt-get install tmux -y 1>> log.log`

echo ""
echo "Installing zsh...."
echo `sudo apt-get install zsh -y 1>> log.log`

echo ""
echo "Installing clang...."
echo `sudo apt-get install clang -y 1>> log.log`
TMP="/usr/lib/x86_64-linux-gnu"
echo `sudo ln -s $TMP/libclang-*.so.* $TMP/libclang.so`

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

ZSH_LOC="`sudo which zsh`"
echo `sudo chsh -s $ZSH_LOC`
