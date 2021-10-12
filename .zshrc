# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load aliases file
if [ -e $HOME/.aliases ]; then
     source $HOME/.aliases
fi


# Export some key variables
export ZSH="$(antibody path robbyrussell/oh-my-zsh)"
export CLICOLOR=YES
export UPDATE_ZSH_DAYS=13
export plugin_cache_dir="$HOME/.terraform.d/plugin-cache"

# Lazy load command completion and colors
autoload -Uz compinit colors
if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
  compinit; colors
else
  compinit -C; colors
fi

# Load plugins - this must come after declaring $ZSH and loading compinit
source $HOME/.zsh_plugins.sh 
# Original source for oh my zsh is replaced by zsh_plugins script from anitbody
# source $ZSH/oh-my-zsh.sh

# Set options
setopt AUTO_CD NO_CASE_GLOB EXTENDED_HISTORY SHARE_HISTORY APPEND_HISTORY INC_APPEND_HISTORY HIST_EXPIRE_DUPS_FIRST HIST_IGNORE_DUPS HIST_REDUCE_BLANKS

# ZShell Variables
ZSH_THEME="robbyrussell"
ZSH_AUTOSUGGEST_STRATEGY="history"
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_USE_ASYNC=true

# History Variables
HISTFILE=~/.zsh_history
SAVEHIST=5000
HISTSIZE=5000

# Compdef autocompletions

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2

if whence dircolors >/dev/null; then
  eval "$(dircolors -b)"
  zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
  alias ls='ls --color'
else
  export CLICOLOR=1
  zstyle ':completion:*:default' list-colors ''
fi

zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# My ZSH Configurations

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kodjoz/.local/bin/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/kodjoz/.local/bin/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/kodjoz/.local/bin/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/kodjoz/.local/bin/google-cloud-sdk/completion.zsh.inc'; fi

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
