#! /bin/bash

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
echo "Installing Python3...."
echo `apt-get install python3 -y 1>> output.txt`

echo ""
echo "Installing NeoVim...."
echo `pip install --upgrade pip 1>> output.txt`
echo `pip3 install --upgrade pip3 1>> output.txt`
echo `apt-get install software-properties-common -y 1>> output.txt`
echo `apt-get install python-dev python-pip python3-dev python3-pip -y 1>> output.txt`
echo `add-apt-repository ppa:neovim-ppa/unstable -y 1>> output.txt`
echo `pip2 install --yes --user neovim 1>> output.txt`
echo `pip3 install --yes --user neovim 1>> output.txt`
echo `apt-get install neovim -y 1>> output.txt`

echo ""
echo "Installing git...."
echo `apt-get install git 1>> output.txt`
echo `git clone https://github.com/VundleVim/Vundle.vim.git~/.vim/bundle/Vundle.vim 1>> output.txt`

