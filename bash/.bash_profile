# .bash_profile

# Get the aliases and functions
[ -f $HOME/.bashrc ] && . $HOME/.bashrc

[ -f $HOME/.profile ] && . $HOME/.profile

if [[ $(tty) == '/dev/tty1' ]]; then
	startx -- -dpi 125
fi
