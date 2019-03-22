# .bash_profile

DOTFILES_DIR="${HOME}/.dotfiles"

# Get the aliases and functions
[ -f $HOME/.bashrc ] && . $HOME/.bashrc

[ -f $HOME/.profile ] && . $HOME/.profile

for DOTFILE in "$DOTFILES_DIR"/system/.*; do
	[ -f "$DOTFILE" ] && . "$DOTFILE"
done

# Start WM
if [[ $(tty) == '/dev/tty1' ]]; then
	exec startx
fi
