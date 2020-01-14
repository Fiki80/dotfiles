export XDG_CONFIG_HOME := $(HOME)/.config

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
	@stow -t $(HOME) bash
	@stow -t $(HOME) bin
	@stow -t $(HOME) git
	@stow -t $(HOME) system
	@stow -t $(HOME) x
	@stow -t $(HOME) xrdb
	@stow -t $(XDG_CONFIG_HOME) config
	@echo "Done"

unlink: stow
	@echo "Removing symlinks..."
	@stow --delete -t $(HOME) bash
	@stow --delete -t $(HOME) bin
	@stow --delete -t $(HOME) git
	@stow --delete -t $(HOME) system
	@stow --delete -t $(HOME) x
	@stow --delete -t $(HOME) xrdb
	@stow --delete -t $(XDG_CONFIG_HOME) config
	@echo "Done"
