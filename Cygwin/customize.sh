#!/bin/sh

#chere -if -t mintty -o "-i /Cygwin-Terminal.ico"
#regtool -w -s set /HKCR/Directory/Background/shell/cygwin64_bash/Icon "$(cygpath -w "$(pwd)")\\Cygwin-Terminal.ico"

curl https://raw.githubusercontent.com/transcode-open/apt-cyg/master/apt-cyg > apt && install apt /bin
rm -f apt
apt install git zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

mkdir ~/.ssh && echo "Host *\nAddKeysToAgent yes" >> ~/.ssh/config
