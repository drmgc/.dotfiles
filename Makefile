DF_DIR=`pwd`

.PHONY : deploy
deploy: zsh vim git i3 i3status emacs ideavim sublime-text-3

.PHONY : zsh
zsh:
	ln -sfn $(DF_DIR)/zsh/.zshrc $(HOME)/.zshrc

.PHONY : vim
vim:
	ln -sfn $(DF_DIR)/vim/.vim $(HOME)/.vim
	ln -sfn $(DF_DIR)/vim/.vimrc $(HOME)/.vimrc

.PHONY : i3
i3:
	ln -sfn $(DF_DIR)/i3/.i3 $(HOME)/.i3

.PHONY : i3status
i3status:
	ln -sfn $(DF_DIR)/i3status/.i3status.conf $(HOME)/.i3status.conf

.PHONY : git
git:
	ln -sfn $(DF_DIR)/git/.gitconfig $(HOME)/.gitconfig

.PHONY : emacs
emacs:
	ln -sfn $(DF_DIR)/emacs/.emacs $(HOME)/.emacs
	ln -sfn $(DF_DIR)/emacs/.emacs.d $(HOME)/.emacs.d

.PHONY : ideavim
ideavim:
	ln -sfn $(DF_DIR)/ideavim/.ideavimrc $(HOME)/.ideavimrc

.PHONY : sublime-text-3
sublime-text-3:
	ln -sfn $(DF_DIR)/sublime-text-3/.config/sublime-text-3 $(HOME)/.config/sublime-text-3
