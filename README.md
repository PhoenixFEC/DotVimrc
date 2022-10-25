# DotVimrc (MocOS)
Personal Vim configuration.

## Requirements
- Install [vim-plug](https://github.com/junegunn/vim-plug#installation) or [dein](https://github.com/Shougo/dein.vim#requirements)

## Note
Please backup your ~/.vimrc before install.

## Install
  ```bash
  git clone --depth=1 https://github.com/PhoenixFEC/CDotVimrc.git ~/tmp/CDotVimrc
  cd ~/tmp/CDotVimrc
  # plug manager with dein.vim
  # sh generate_vimrc.sh dein
  # or use vim-plug (default)
  sh generate_vimrc.sh
  # If the `generate_vimrc.sh` has not "x" permission, you must execute below command first:
  # chmod u+x generate_vimrc.sh
  ```

## User configuration
```bash
~/.DotVimrc.d
  |- vimrc.vim          # custom configuration, include basic, key mapping, command and so on
  |- plugins.vim        # [TODO] custom plugin list
```

## Thanks
Borrowing shamelessly from [ThinkVim](https://github.com/imxiejie/ThinkVim), [SpaceVim](https://github.com/SpaceVim/SpaceVim), [vimrc](https://github.com/amix/vimrc), thank them for open source.
