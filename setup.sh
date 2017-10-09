#!/bin/sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ ! -d ${HOME}/etc ]
then
	ln -s ${DIR}/etc ${HOME}/etc
fi

if [ ! -d ${HOME}/bin ]
then
	ln -s ${DIR}/bin ${HOME}/bin
fi

[ ! -e ${HOME}/.Xresources ] && ln -s ${HOME}/etc/.Xresources ${HOME}/.Xresources
