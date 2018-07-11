#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ ! -d ${HOME}/etc ]
then
	ln -s ${DIR}/etc ${HOME}/etc
fi

if [ ! -d ${HOME}/bin ]
then
	ln -s ${DIR}/bin ${HOME}/bin
fi

install_file() {
	[ ! -e ${HOME}/$1 ] && ln -s ${HOME}/etc/$1 ${HOME}/$1
	
}

install_file .Xresources
install_file .tmux.conf
install_file .emacs.d

if [ ! -d ${HOME}/.config/base16-shell/ ]
then
	git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
	source /home/yuri/repos/dotfiles/etc/base16.sh
fi

