UNAME=$(shell uname -n)
export XDG_CONFIG_HOME := $(HOME)/testhome/.config
TARGET=$(HOME)/testhome

.PHONY: all help system stow link unlink

ifeq ($(UNAME), x230)
all: link_x230
endif
ifeq ($(UNAME), void)
all: link_void
endif
ifeq ($(UNAME), manjaro)
all: link_manjaro
endif

help:
	@echo "\nUsage:"
	@echo "\tmake [ system | link | unlink ]\n"
	@echo "\tsystem ... perform install of needed packages"
	@echo "\tlink ..... create dotfile's symlinks"
	@echo "\tunlink ... remove symlinks"
	@echo ""

system:
	@./install_apps

stow:
	@type stow > /dev/null 2>&1 || xbps-install -Sy stow

link_void: stow
	@echo "Creating symlinks..."
	@mkdir -p $(XDG_CONFIG_HOME)
	@stow -t $(TARGET) bash
	@stow -t $(TARGET) bin
	@stow -t $(TARGET) git
	@stow -t $(TARGET) system
	@cd x && stow -t $(TARGET) void && cd ..
	@stow -t $(TARGET) xrdb
	@stow -t $(XDG_CONFIG_HOME) config
	@echo "Done."

unlink_void: stow
	@echo "Removing symlinks..."
	@stow --delete -t $(TARGET) bash
	@stow --delete -t $(TARGET) bin
	@stow --delete -t $(TARGET) git
	@stow --delete -t $(TARGET) system
	@cd x && stow --delete -t $(TARGET) void && cd ..
	@stow --delete -t $(TARGET) xrdb
	@stow --delete -t $(XDG_CONFIG_HOME) config
	@echo "Done."
