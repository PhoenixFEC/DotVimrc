#!/bin/sh
# option: -e 若指令传回值不等于0，则立即退出shell
set -e

VERSION="0.1.0"
REAL_VIM_PATH=$(pwd)
VIMRC_PATH="${HOME}/.config/DotVimrc"
THIS_TIME=$(date +%c)

# vim-plug is default, you can specify dein.vim by first arg with "dein"
if [ $1 ] && [ x$1 == xdein ];
  then VIM_PLUGIN_MANAGER="dein.vim"
else
  VIM_PLUGIN_MANAGER="vim-plug"
fi

if [ ! -d ${HOME}/.config ];
  then $(mkdir ${HOME/.config})
fi
# TODO: copy to `.config` directory
# $(ln -snfi ${REAL_VIM_PATH} ${VIMRC_PATH})
$(cp -af ${REAL_VIM_PATH} ${VIMRC_PATH})

# config Git Credential to cache(900s)
$(git config --global credential.helper cache)

echo "${THIS_TIME}"
echo "\" DO NOT EDIT THIS FILE
\" It was generated for Vim (at ${THIS_TIME})
\" Version: ${VERSION}

let \$VIM_PLUGIN_MANAGER = \"${VIM_PLUGIN_MANAGER}\"
source ${VIMRC_PATH}/init.vim

" > ~/.vimrc

echo "___________________________________________________________"
echo "==========================================================="
echo ">*"
echo ">* Generated the Vim Configuration successfully! Enjoy it :)"
echo ">*"
echo "==========================================================="