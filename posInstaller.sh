#!/bin/bash

if ! command -v vim &>/dev/null; then
  echo "Vim not installed yet"
  exit 1
fi

DIST_VIM=~/.vim
mkdir -p $DIST_VIM/autoload $DIST_VIM/bundle $DIST_VIM/colors

if [ -f "$DIST_VIM/autoload/pathogen.vim" ]; then
  echo "[X] Pathogen"
else
  echo "Installing the Pathogen packge manager"
  curl -LSso $DIST_VIM/autoload/pathogen.vim "https://tpo.pe/pathogen.vim"
  echo "[X] Pathogen"
fi

if [ -d "$DIST_VIM/bundle/nerdtree" ]; then
  echo "[X] NERDtree"
else
  echo "Installing the NERDtree file system explorer"
  git clone https://github.com/preservim/nerdtree.git $DIST_VIM/bundle/nerdtree
  echo "[X] NERDtree"
fi

if [ -d "$DIST_VIM/bundle/emmet-vim" ]; then
  echo "[X] Emmet-vim"
else
  echo "Installing the Emmet the essential toolkit for web-developers"
  git clone https://github.com/mattn/emmet-vim.git $DIST_VIM/bundle/emmet-vim
  echo "[X] Emmet-vim"
fi

if [ -f "$DIST_VIM/colors/Tomorrow-Night-Eighties.vim" ]; then
  echo "[X] vim-tomorrow-theme"
else
	echo "Installing theme vim-tomorrow-theme"
	wget https://raw.githubusercontent.com/chriskempson/vim-tomorrow-theme/master/colors/Tomorrow-Night-Eighties.vim -P $DIST_VIM/colors/
	echo "[X] vim-tomorrow-theme"
fi

cat << EOF > ~/.vimrc
execute pathogen#infect()
colorscheme Tomorrow-Night-Eighties
set tabstop=2
filetype plugin indent on
syntax on
set shiftwidth=2
set backspace=2
set number

set relativenumber
set incsearch
set hlsearch

set fileencoding=iso-8859-1
set encoding=iso-8859-1

set expandtab
set softtabstop=2
EOF
