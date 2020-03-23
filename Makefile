UNAME=$(shell uname -n)
export XDG_CONFIG_HOME := $(HOME)/.config
TARGET=$(HOME)

.PHONY: all help link unlink

all: link

help:
	@echo "\nUsage:"
	@echo "\tmake [ link | unlink ]\n"
	@echo "\tsystem ... perform install of needed packages"
	@echo "\tlink ..... create dotfile's symlinks"
	@echo "\tunlink ... remove symlinks"
	@echo ""

link: system
	@echo "Creating symlinks..."
	@rm -f ~/.bash_profile ~/.bashrc ~/.inputrc
	@mkdir -p $(XDG_CONFIG_HOME)
	@stow -t $(TARGET) bash
	@stow -t $(TARGET) bin
	@stow -t $(TARGET) git
	@stow -t $(TARGET) system
	@stow -t $(TARGET) x_$(UNAME)
	@stow -t $(TARGET) xrdb
	@stow -t $(XDG_CONFIG_HOME) config_$(UNAME)
	@sudo stow -t /etc/fonts fonts
	@echo "Done."

unlink:
	@echo "Removing symlinks..."
	@stow --delete -t $(TARGET) bash
	@stow --delete -t $(TARGET) bin
	@stow --delete -t $(TARGET) git
	@stow --delete -t $(TARGET) system
	@stow --delete -t $(TARGET) x_$(UNAME)
	@stow --delete -t $(TARGET) xrdb
	@stow --delete -t $(XDG_CONFIG_HOME) config_$(UNAME)
	@stow --delete -t /etc/fonts fonts
	@echo "Done."
