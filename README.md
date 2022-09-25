# DotVimrc (MocOS)
Borrowing shamelessly from ThinkVim, SpaceVim, vimrc, thanks for them.
## Install
	```bash
	git clone ....
	cd CDotVimrc
	# plug manager with dein.vim
	# sh generate_vimrc.sh dein
	# or use vim-plug (default)
	sh generate_vimrc.sh
  # If the `generate_vimrc.sh` has not "x" permission, you must execute below command first:
  # chmod u+x generate_vimrc.sh
	```
## User configuration
	- directory -> .DotVimrc.d
	- general -> .DotVimrc.d/vimrc.vim
	- plugins -> .DotVimrc.d/plugins.yaml

## Note
Please backup your ~/.vimrc before install.
Use `hook_add` property to config Plugin when enabled vim-plug.

