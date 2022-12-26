#!/bin/sh
# option: -e 若指令传回值不等于0，则立即退出shell
set -e

VERSION="0.1.0"
THIS_TIME=$(date +%c)
DotVimrc=".DotVimrc"

# success/info/error/warn {{{
msg() {
  printf '%b\n' "$1" >&2
}

success() {
  msg "${Green}[✔]${Color_off} ${1}${2}"
}

info() {
  msg "${Blue}[➭]${Color_off} ${1}${2}"
}

error() {
  msg "${Red}[✘]${Color_off} ${1}${2}"
  exit 1
}

warn () {
  msg "${Yellow}[⚠]${Color_off} ${1}${2}"
}
# }}}

# echo_with_color {{{
echo_with_color() {
  printf '%b\n' "$1$2$Color_off" >&2
}
# }}}

# write_to_conf {{{
write_to_conf() {
  success "$1 is already"
  # Trying to define ENV '$VIM_PLUGIN_MANAGER'
  sed -i "" "4a \\
let \$VIM_PLUGIN_MANAGER = '$1'\\
" "$HOME/${DotVimrc}/main.vim"
}
#}}}

# symlink_to_dotvimrc {{{
symlink_to_dotvimrc() {
  if [ "$1" == 'neovim' ]; then
    target_directory='.config/nvim'
  else
    target_directory='.vim'
    # fix vim down in vscode
    # ln -shfi "$HOME/${DotVimrc}/vimrc" "$HOME/.vimrc"
  fi

  ln -shfi "$HOME/${DotVimrc}" "$HOME/${target_directory}"
}
#}}}

# install_vim_plug {{{
install_vim_plug() {
  if [[ -f "$HOME/.vim-plug/plug.vim" ]]; then
    ln -shfi "$HOME/.vim-plug/plug.vim" "$HOME/${DotVimrc}/autoload/plug.vim"
    ln -shfi "$HOME/.vim-plug/plug.vim" "${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/plug.vim"
    success "$1 vim-plug"
  fi
}
# }}}

# install_vim_plugins {{{
# }}}

# fetch_repo {{{
fetch_repo() {
  # DotVimrc repo
  if [[ -d "$HOME/${DotVimrc}" ]]; then
    info "Trying to update ${DotVimrc: 1}"

    cd "$HOME/${DotVimrc}"
    git checkout -- .
    git pull --prune --rebase
    cd - > /dev/null 2>&1

    success "Successfully update ${DotVimrc: 1}"
  else
    info "Trying to clone ${DotVimrc: 1}"

    if [[ $1 != '--dev' ]]; then
        git clone https://github.com/PhoenixFEC/${DotVimrc: 1}.git "$HOME/${DotVimrc}"
    else
        git clone ~/MyProjects/${DotVimrc: 1} "$HOME/${DotVimrc}"
    fi

    if [ $? -eq 0 ]; then
      # config Git Credential to cache(900s)
      git config --global credential.helper cache
      # git config --global http.version HTTP/1.1
      success "Successfully clone ${DotVimrc: 1}"
    else
      error "Failed to clone ${DotVimrc: 1}"
      exit 0
    fi
  fi

  if [[ $# == 1 && $1 == 'dein' ]]; then
    write_to_conf 'dein'
  else
    write_to_conf 'vim-plug'
  fi

  # vim-plug repo
  if [[ $1 != 'dein' ]]; then
    if [[ ! -d "$HOME/.vim-plug" ]]; then
      # echo 'start clone ...'
      git clone https://github.com/junegunn/vim-plug.git "$HOME/.vim-plug"
      # echo 'end clone.'
      install_vim_plug 'Installed'
    # else
      # TODO: install_vim_plug 'Updated'
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
    if [[ "$(readlink $HOME/.vim)" =~ ${DotVimrc} ]]; then
      success "Installed ${DotVimrc: 1} for vim"
    else
      mv "$HOME/.vim" "$HOME/.vim_back"
      success "BackUp $HOME/.vim to $HOME/.vim_back"
      symlink_to_dotvimrc 'vim'
      success "Installed ${DotVimrc: 1} for vim"
    fi
  else
    symlink_to_dotvimrc 'vim'
    success "Installed ${DotVimrc: 1} for vim"
  fi
}
# }}}

# install_neovim {{{
install_neovim() {
  if [[ -d "$HOME/.config/nvim" ]]; then
    if [[ "$(readlink $HOME/.config/nvim)" =~ ${DotVimrc} ]]; then
      success "Installed ${DotVimrc: 1} for neovim"
    else
      mv "$HOME/.config/nvim" "$HOME/.config/nvim_back"
      success "BackUp $HOME/.config/nvim to $HOME/.config/nvim_back"
      symlink_to_dotvimrc 'neovim'
      success "Installed ${DotVimrc: 1} for neovim"
    fi
  else
    mkdir -p "$HOME/.config"
    symlink_to_dotvimrc 'neovim'
    success "Installed ${DotVimrc: 1} for neovim"
  fi
}
# }}}

# uninstall_vim {{{
uninstall_vim() {
  if [[ -d "$HOME/.vim" ]]; then
    if [[ "$(readlink $HOME/.vim)" =~ ${DotVimrc} ]]; then
      rm "$HOME/.vim"
      success "Uninstall ${DotVimrc: 1} for vim"
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
    if [[ "$(readlink $HOME/.config/nvim)" =~ ${DotVimrc} ]]; then
      rm "$HOME/.config/nvim"
      success "Uninstall ${DotVimrc: 1} for neovim"
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
  case $1 in
    'vim')
      thename='Vim'
    ;;

    'neovim')
      thename='Neovim'
    ;;

    *)
      thename='Vim or Neovim'
    ;;
  esac

  echo_with_color ${blue} ""
  echo_with_color ${blue} "=    ✌︎︎ Almost done!"
  echo_with_color ${blue} "============================================================================="
  echo_with_color ${blue} "=    ${THIS_TIME} - ${DotVimrc: 1} V${VERSION}"
  echo_with_color ${blue} "=    Open ${thename} and it will install the plugins automatically"
  echo_with_color ${blue} "============================================================================="
  echo_with_color ${blue} "=    ☕️ Enjoy it."
  echo_with_color ${blue} ""
}
# }}}

# helper {{{
helper () {
  echo ""
  echo "${DotVimrc: 1} install script : V${VERSION}"
  echo ""
  echo "Usage : install.sh [option] [target]"
  echo ""
  echo ""
  echo "OPTIONS"
  echo ""
  echo " -i, --install <target>                   Install ${DotVimrc: 1} for vim or neovim"
  echo "      -pm, --plugin-manager [target]      Specify vim plugin manager"
  echo " -un, --uninstall                         Uninstall ${DotVimrc: 1}"
  echo " -v, --version                            Show version information and exit"
  echo ""
  echo "EXAMPLE"
  echo ""
  echo "    Install ${DotVimrc: 1} for vim and neovim"
  echo ""
  echo "        install.sh  \"Same as 'install.sh --install all'"
  echo ""
  echo "    Install ${DotVimrc: 1} for vim only or neovim only"
  echo ""
  echo "        install.sh --install vim"
  echo "        install.sh --install neovim"
  echo "        install.sh --install neovim --plugin-manager   \"To use vim-plug"
  echo "        install.sh --install neovim --plugin-manager dein  \"To use dein"
  echo ""
  echo "    Uninstall ${DotVimrc: 1}"
  echo ""
  echo "        install.sh --uninstall"
  echo ""
}
#}}}

# main {{{
main() {
  if [ $# -gt 0 ]; then
    case $3 in
      --plugin-manager|-pm)
        if [[ $# == 4 && $4 == 'dein' ]]; then
          VIM_PLUGIN_MANAGER="dein"
        else
          VIM_PLUGIN_MANAGER="vim-plug"
        fi
      ;;

      *)
        VIM_PLUGIN_MANAGER="vim-plug"
      ;;
    esac

    case $1 in
        --dev)
            fetch_repo ${VIM_PLUGIN_MANAGER}

            if [ $# -eq 2 ]; then
            case $2 in
                'vim')
                install_vim
                ;;

                'neovim')
                install_neovim
                ;;

                *)
                install_vim
                install_neovim
                ;;
            esac
            fi

            install_done $2

            exit 0
        ;;

        --install|-i)
            fetch_repo ${VIM_PLUGIN_MANAGER}

            if [ $# -eq 2 ]; then
            case $2 in
                'vim')
                install_vim
                ;;

                'neovim')
                install_neovim
                ;;

                *)
                install_vim
                install_neovim
                ;;
            esac
            fi

            install_done $2

            exit 0
        ;;

        --uninstall|-un)
            uninstall_vim
            uninstall_neovim

            echo_with_color ""
            echo_with_color ${BWhite} "Looking forward to meeting you again"
            echo_with_color ${BWhite} "Thanks!"
            echo_with_color ""

            exit 0
        ;;

        --version|-v)
            msg "V${VERSION}"
            exit 0
        ;;

        --help|-h)
            helper
            exit 0
        ;;
    esac

  else
    # install both Vim and Neovim
    fetch_repo 'vim-plug'
    install_vim
    install_neovim
    install_done 'all'
  fi
}
#}}}

main $@
