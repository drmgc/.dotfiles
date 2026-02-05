DF_DIR=`pwd`

.PHONOY : default
default:
	$(info **** Target deploy mode is not selected ****)

.PHONY : deploy-common
deploy-common: vim git i3 i3status ideavim

.PHONY : deploy-sabertooth
deploy-sabertooth: deploy-common

.PHONY : vim
vim:
	ln -svn $(DF_DIR)/vim/.vim $(HOME)/.vim
	ln -svn $(DF_DIR)/vim/.vimrc $(HOME)/.vimrc

.PHONY : i3
i3:
	ln -svn $(DF_DIR)/i3/ $(HOME)/.i3

.PHONY : i3status
i3status:
	ln -svn $(DF_DIR)/i3status/ $(HOME)/.config/i3status

.PHONY : rofi
rofi:
	ln -svn $(DF_DIR)/rofi $(HOME)/.config/rofi

.PHONY : git
git:
	ln -svn $(DF_DIR)/git/.gitconfig $(HOME)/.gitconfig

.PHONY : ideavim
ideavim:
	ln -svn $(DF_DIR)/ideavim/.ideavimrc $(HOME)/.ideavimrc

.PHONY : tmux
tmux:
	ln -svn $(DF_DIR)/.tmux.conf $(HOME)/.tmux.conf

.PHONY : zellij
zellij:
	ln -svn $(DF_DIR)/zellij $(HOME)/.config/zellij

