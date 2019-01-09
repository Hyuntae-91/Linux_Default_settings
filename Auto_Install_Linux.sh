#! /bin/bash

CHECK_OS="`uname -s`"
DEFAULT_DIR=$HOME
WORK_DIR=$PWD

clear
echo "========================================"
echo "== Installing dev-env ... Please wait =="
echo "========================================"

if [ $UID != 0 ];
then
    echo ""
    echo "Your not Root !! Use 'sudo' command"
    exit 1
fi

echo ""
echo "Installing Python2...."
echo `apt-get install python -y 1>> log.log`
echo "done"
echo ""
echo "Installing Python3...."
echo `apt-get install python3 -y 1>> log.log`
echo "done"

echo ""
echo "Installing NeoVim...."
echo `pip install --upgrade pip 1>> log.log`
echo `pip3 install --upgrade pip3 1>> log.log`
echo `apt-get install software-properties-common -y 1>> log.log`
echo `apt-get install python-dev python-pip python3-dev python3-pip -y 1>> log.log`
echo `add-apt-repository ppa:neovim-ppa/unstable -y 1>> log.log`
echo `pip2 install --user neovim 1>> log.log`
echo `pip3 install --user neovim 1>> log.log`
echo `apt-get install neovim -y 1>> log.log`
echo `pip install --upgrade neovim 1>> log.log`
echo `pip3 install --upgrade neovim 1>> log.log`
echo "done"

echo ""
echo "Installing git...."
echo `apt-get install git -y 1>> log.log`
echo `git clone https://github.com/VundleVim/Vundle.vim.git~/.vim/bundle/Vundle.vim 1>> log.log`
echo "done"

echo ""
echo "Installing tmux...."
echo `apt-get install tmux -y 1>> log.log`
echo "done"

echo ""
echo "Installing zsh...."
echo `apt-get install zsh -y 1>> log.log`
echo "done"

echo ""
echo "Installing clang...."
echo `sudo apt-get install clang -y 1>> log.log`
TMP="/usr/lib/x86_64-linux-gnu"
echo `ln -s $TMP/libclang-*.so.* $TMP/libclang.so`
echo "done"

echo ""
echo "Copying Configuring files..."
echo `cp $PWD/.bashrc DEFAULT_DIR/.bashrc 1>> log.log`
echo `cp $PWD/.zshrc DEFAULT_DIR/.zshrc 1>> log.log`
echo `cp $PWD/.vimrc DEFAULT_DIR/.vimrc 1>> log.log`
echo `cp $PWD/init.vim DEFAULT_DIR/.config/nvim/ 1>> log.log`
echo `cp $PWD/agnoster.zsh-theme DEFAULT_DIR/.oh-my-zsh/themes/ 1>> log.log`
echo `cp $PWD/.tmux.conf DEFAULT_DIR/ 1>> log.log`
echo `cp $PWD/python.snippets DEFAULT_DIR/.vim/vim-snippets/snippets/ 1>> log.log`
echo "done"

echo ""
echo "Installing NeoVim Plugin...."
echo `nvim -c 'PluginInstall' -c 'qa!'`
echo `nvim -c ':UpdateRemotePlugins' -c 'qa!'`
echo "done"

echo ""
echo "Installing Oh-My-Zsh..."
echo `curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh`
echo "done"
