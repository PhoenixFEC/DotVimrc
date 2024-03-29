# DotVimrc (MocOS)
Personal Vim configuration.

## Requirements
- ~~Install [vim-plug](https://github.com/junegunn/vim-plug#installation) or [dein](https://github.com/Shougo/dein.vim#requirements)~~

## Note
Please backup your ~/.vimrc before install.

## Install
  ```bash
  git clone --depth=1 https://github.com/PhoenixFEC/CDotVimrc.git ~/.DotVimrc
  cd ~/.DotVimrc
  # plug manager with dein.vim
  # sh install.sh --install all --plugin-manager dein
  # or use vim-plug (default), install both Vim and Neovim configurations with the below:
  sh install.sh
  # If the `install.sh` has not "x" permission, you must execute below command first:
  # chmod u+x install.sh

  # for help:
  sh install.sh --help


  # or install on remote
  sudo bash -c "$(curl -fsSL https://github.com/PhoenixFEC/DotVimrc/releases/download/v0.1.0/install.sh)"
  sudo bash -c "$(curl -fsSL https://github.com/PhoenixFEC/DotVimrc/releases/download/v0.1.0/install.sh --install neovim)"
  ```

## User configuration
```bash
~/.DotVimrc.d
  |- vimrc.vim          # custom configuration, include basic, key mapping, command and so on
  |- plugins.vim        # [TODO] custom plugin list
```

## Acknowledgments
- [ThinkVim](https://github.com/imxiejie/ThinkVim)
- [SpaceVim](https://github.com/SpaceVim/SpaceVim)
- [vimrc](https://github.com/amix/vimrc)
- [theniceboy](https://github.com/theniceboy/nvim)
