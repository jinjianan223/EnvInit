#!/bin/bash

sudo apt-get -y install tldr
sudo apt-get -y install clang-format
sudo apt-get -y install cppcheck 
dir="${HOME}/.vim/"
echo $dir
if [ ! -d "$dir" ];then
  mkdir $dir
  echo ".vim文件夹创建成功"
else
  echo ".vim文件夹已经存在"
fi

if [ ! -d "$dir/colors" ];then
  mkdir "$dir/colors"
  echo "colors文件夹创建成功"
else
  echo "colors文件夹已经存在"
fi

if [ ! -d "$dir/autoload" ];then
  mkdir "$dir/autoload"
  echo "autoload文件夹创建成功"
else
  echo "autoload文件夹已经存在"
fi
cp plug.vim ~/.vim/autoload/
cp neodark.vim ~/.vim/colors/
cp .vimrc ~/.vimrc 

cd ~
clang-format -style=Google -dump-config > .clang-format

echo "文件拷贝完成! 请进入vim中进行PlugInstall"
echo "YCM安装流程：
      1. cd ~/.vim/plugged/YouCompleteMe
      2. git submodule -init -recursive
      3. 若某个模块无法安装，则手动clone，如git clone https://github.com.cnpmjs.org/psf/requests.git third_party/requests_deps/requests
      4. python3 install.py --clangd-completer"
echo "c++相应namespace等配色在.vim/plugged/cpp-enhanced-highlighti中"
