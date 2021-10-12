# Profile file, read at login after .zshenv

# Set some defaults - US based/biased
# Set the path to your trash bin for safe deletion
# Note: this folder may or may not already exist on your system
if [ $(uname -s) = 'Darwin' ]; then
    export TRASH_PATH=$HOME/.Trash
elif [ $(uname -s) = (?i)linux ]; then
    mkdir -p $HOME/.local/share/Trash/files
    export TRASH_PATH=$HOME/.local/share/Trash/files
fi

# Load nvm to all shells - if it's already installed
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # Load bash completions for nvm
export NVM_AUTO_USE=true
export NVM_LAZY_LOAD=true

