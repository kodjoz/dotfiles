# Set user umask
umask 077

# Set up zsh environment default path
if [[ -z "$PATH" || "$PATH" == "/bin:/usr/bin" ]]
then
	export PATH="/usr/local/bin:/usr/bin:/usr/sbin:/usr/local/sbin:/bin:/usr/games"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export EDITOR=vim
export VISUAL="$EDITOR"
export SUDO_EDITOR=rvim
export GPG_TTY="$TTY"
export LANG=en_US.UTF-8
