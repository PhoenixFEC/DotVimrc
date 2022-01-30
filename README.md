# DotVimrc (MocOS)
Borrowing shamelessly from ThinkVim, SpaceVim, vimrc, thanks for them.
## Install
	```bash
	git clone ....
	cd CDotVimrc
	# or use vim-plug (default)
	sh generate_vimrc.sh
	# plug manager with dein.vim
	# sh generate_vimrc.sh dein
	```
## User configuration
	- directory -> .DotVimrc.d
	- general -> .DotVimrc.d/vimrc.vim
	- plugins -> .DotVimrc.d/plugins.yaml

## Note
Please backup your ~/.vimrc before install.
Use `hook_add` property to config Plugin when enabled vim-plug.

