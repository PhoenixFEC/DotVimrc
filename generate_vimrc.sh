#!/bin/sh
# option: -e 若指令传回值不等于0，则立即退出shell
set -e

VERSION="0.0.3"
THIS_TIME=$(date +%c)

# "vim-plug" is default, you can specify "dein.vim" with the first arg "dein"
if [ $1 ] && [ x$1 == xdein ];
  then VIM_PLUGIN_MANAGER="dein.vim"
else
  VIM_PLUGIN_MANAGER="vim-plug"
fi

# let $VIM_PLUGIN_MANAGER = "${VIM_PLUGIN_MANAGER}"

# echo_with_color {{{
echo_with_color() {
  printf '%b\n' "$1$2$Color_off" >&2
}
# }}}

# write_to_conf {{{
write_to_conf() {
  echo $1
}
#}}}

# symlink_to_dotvimrc {{{
symlink_to_dotvimrc() {
  if [ $1 -eq 'neovim']; then
    target_directory='/.config/nvim'
    write_to_conf 'neovim'
    echo 'neovim symlink'
  else
    target_directory='/.vim'
    write_to_conf 'vim'
    echo 'vim symlink'
  fi

  ln -s "$HOME/.DotVimrc" "$HOME${target_directory}"

  # config Git Credential to cache(900s)
  git config --global credential.helper cache
}
#}}}

# fetch_repo {{{
fetch_repo () {
    if [[ -d "$HOME/.DotVimrc" ]]; then
        info "Trying to update DotVimrc"
        cd "$HOME/.DotVimrc"
        git pull
        cd - > /dev/null 2>&1
        success "Successfully update DotVimrc"
    else
        info "Trying to clone DotVimrc"
        git clone https://github.com/PhoenixFEC/CDotVimrc.git "$HOME/.DotVimrc"
        if [ $? -eq 0 ]; then
            success "Successfully clone DotVimrc"
        else
            error "Failed to clone DotVimrc"
            exit 0
        fi
    fi
}
# }}}

# install_vim {{{
install_vim() {
  if [[ -f "$HOME/.vimrc" ]]; then
    mv "$HOME/.vimrc" "$HOME/.vimrc_back"
    success "Backup $HOME/.vimrc to $HOME/.vimrc_back"
  fi

  if [[ -d "$HOME/.vim" ]]; then
    if [[ "$(readlink $HOME/.vim)" =~ \.DotVimrc$ ]]; then
      success "Installed DotVimrc for vim"
    else
      mv "$HOME/.vim" "$HOME/.vim_back"
      success "BackUp $HOME/.vim to $HOME/.vim_back"
      # ln -s "$HOME/.DotVimrc" "$HOME/.vim"
      symlink_to_dotvimrc 'vim'
      success "Installed DotVimrc for vim"
    fi
  else
    # ln -s "$HOME/.DotVimrc" "$HOME/.vim"
    symlink_to_dotvimrc 'vim'
    success "Installed DotVimrc for vim"
  fi
}
# }}}

# install_neovim {{{
install_neovim() {
  if [[ -d "$HOME/.config/nvim" ]]; then
    if [[ "$(readlink $HOME/.config/nvim)" =~ \.DotVimrc$ ]]; then
      success "Installed DotVimrc for neovim"
    else
      mv "$HOME/.config/nvim" "$HOME/.config/nvim_back"
      success "BackUp $HOME/.config/nvim to $HOME/.config/nvim_back"
      # ln -s "$HOME/.DotVimrc" "$HOME/.config/nvim"
      symlink_to_dotvimrc 'neovim'
      success "Installed DotVimrc for neovim"
    fi
  else
    mkdir -p "$HOME/.config"
    # ln -s "$HOME/.DotVimrc" "$HOME/.config/nvim"
    symlink_to_dotvimrc 'neovim'
    success "Installed DotVimrc for neovim"
  fi
}
# }}}

# uninstall_vim {{{
uninstall_vim() {
  if [[ -d "$HOME/.vim" ]]; then
    if [[ "$(readlink $HOME/.vim)" =~ \.DotVimrc$ ]]; then
      rm "$HOME/.vim"
      success "Uninstall DotVimrc for vim"
      if [[ -d "$HOME/.vim_back" ]]; then
        mv "$HOME/.vim_back" "$HOME/.vim"
        success "Recover from $HOME/.vim_back"
      fi
    fi
  fi
  if [[ -f "$HOME/.vimrc_back" ]]; then
    mv "$HOME/.vimrc_back" "$HOME/.vimrc"
    success "Recover from $HOME/.vimrc_back"
  fi
}
# }}}

# uninstall_neovim {{{
uninstall_neovim() {
  if [[ -d "$HOME/.config/nvim" ]]; then
    if [[ "$(readlink $HOME/.config/nvim)" =~ \.DotVimrc$ ]]; then
      rm "$HOME/.config/nvim"
      success "Uninstall DotVimrc for neovim"
      if [[ -d "$HOME/.config/nvim_back" ]]; then
        mv "$HOME/.config/nvim_back" "$HOME/.config/nvim"
        success "Recover from $HOME/.config/nvim_back"
      fi
    fi
  fi
}
# }}}

# install_done {{{
install_done() {
  echo_with_color ${blue} ""
  echo_with_color ${blue} "Almost done!"
  echo_with_color ${blue} "=============================================================================="
  echo_with_color ${blue} "==    ${THIS_TIME} - DotVimrc V${VERSION}"
  echo_with_color ${blue} "==    Open Vim or Neovim and it will install the plugins automatically      =="
  echo_with_color ${blue} "=============================================================================="
  echo_with_color ${blue} ""
  echo_with_color ${blue} "Enjoy it."
  echo_with_color ${blue} ""
}
# }}}

# start to install DotVimrc
fetch_repo
install_vim
install_neovim
install_done
