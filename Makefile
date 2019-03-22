export XDG_CONFIG_HOME := $(HOME)/hometest/.config

.PHONY: test

all: core-linux link

core-linux:
	sudo xbps-install -Suv -y

stow: core-linux
	type stow > /dev/null 2>&1 || xbps-install -Sy stow

link: stow
	mkdir -p $(XDG_CONFIG_HOME)
	stow -t $(HOME)/hometest bash
	stow -t $(HOME)/hometest bin
	stow -t $(HOME)/hometest x
	stow -t $(HOME)/hometest xrdb
	stow -t $(XDG_CONFIG_HOME) config

unlink: stow
	stow --delete -t $(HOME)/hometest runcom
	stow --delete -t $(XDG_CONFIG_HOME) config


