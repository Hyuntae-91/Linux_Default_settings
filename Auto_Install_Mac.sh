#! /bin/bash

CHECK_OS="`uname -s`"
DEFAULT_DIR=$HOME
WORK_DIR=$PWD

clear
echo "========================================"
echo "== Installing dev-env ... Please wait =="
echo "========================================"

echo ""
echo "Installing Python2...."
echo `brew install python -y 1>> log.log`
echo "done"
echo ""
echo "Installing Python3...."
echo `brew install python3 -y 1>> log.log`
echo "done"

echo ""
echo "Installing NeoVim...."
echo `pip install --upgrade pip 1>> log.log`
echo `pip install --user neovim 1>> log.log`
echo `brew install neovim -y 1>> log.log`
echo `pip install --upgrade neovim 1>> log.log`
echo "done"

echo ""
echo "Installing tmux...."
echo `brew install tmux -y 1>> log.log`
echo "done"

echo ""
echo "Installing zsh...."
echo `brew install zsh -y 1>> log.log`
echo "done"

echo ""
echo "Copying Configuring files..."
echo `cp $PWD/.bashrc DEFAULT_DIR/.bashrc 1>> log.log`
echo `cp $PWD/.zshrc DEFAULT_DIR/.zshrc 1>> log.log`
echo `cp $PWD/.vimrc DEFAULT_DIR/.vimrc 1>> log.log`

echo ""
echo "Copying Configuring files..."
echo `cp $PWD/.bashrc DEFAULT_DIR/.bashrc 1>> log.log`
echo `cp $PWD/.zshrc DEFAULT_DIR/.zshrc 1>> log.log`
echo `cp $PWD/.vimrc_MAC DEFAULT_DIR/.vimrc 1>> log.log`
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
echo `curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh 1>> log.log`
echo "done"
