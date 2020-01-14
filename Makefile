export XDG_CONFIG_HOME := $(HOME)/hometest/.config

.PHONY: help system

help:
	@echo "\nUsage:"
	@echo "\tmake [ system | link | unlink ]\n"
	@echo "\tsystem ... perform install of needed packages"
	@echo "\tlink ..... create dotfile's symlinks"
	@echo "\tunlink ... remove symlinks"
	@echo ""

system:
	@./install_apps


all: link

stow:
	@type stow > /dev/null 2>&1 || xbps-install -Sy stow

link: stow
	@echo "Creating symlinks..."
	@mkdir -p $(XDG_CONFIG_HOME)
	@stow -t $(HOME)/hometest bash
	@stow -t $(HOME)/hometest bin
	@stow -t $(HOME)/hometest git
	@stow -t $(HOME)/hometest system
	@stow -t $(HOME)/hometest x
	@stow -t $(HOME)/hometest xrdb
	@stow -t $(XDG_CONFIG_HOME) config
	@echo "Done"

unlink: stow
	@echo "Removing symlinks..."
	@stow --delete -t $(HOME)/hometest bash
	@stow --delete -t $(HOME)/hometest bin
	@stow --delete -t $(HOME)/hometest git
	@stow --delete -t $(HOME)/hometest system
	@stow --delete -t $(HOME)/hometest x
	@stow --delete -t $(HOME)/hometest xrdb
	@stow --delete -t $(XDG_CONFIG_HOME) config
	@echo "Done"
