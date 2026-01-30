# default programs
export EDITOR="nvim"
export VISUAL="nvim"

# source some private stuff (like wttr location)
[ -f "$XDG_CONFIG_HOME/shell/.private_keys" ] && source "$XDG_CONFIG_HOME/shell/.private_keys"

# xdg stuff
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"

# get rid of the annoying zcompdump stuff
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

# make sure to set this also in /etc/zsh/zshenv:
# export ZDOTDIR="/home/$USER/.config/shell"
export ZDOTDIR="$XDG_CONFIG_HOME/shell"

# path
path=(
    $path # for previous entries
    $HOME/.local/bin
    $XDG_DATA_HOME/cargo/bin
    $SCRIPTS
)

# remove duplicates and non-existent dirs
# stolen from Mischa van den Burg
typeset -U path
path=($^path(N-/))

export PATH
# random
export HYPRSHOT_DIR="$HOME/Pictures/screenshots"
export ZSH="$HOME/.oh-my-zsh"
export SCRIPTS="$HOME/scripts"

# moving everything from my home folder (including the zsh stuff above)
export _Z_DATA="$XDG_CACHE_HOME/z"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"
alias nvidia-settings="nvidia-settings --config=$XDG_CONFIG_HOME/nvidia/settings"

# fzf stuff
export FZF_DEFAULT_OPTS="--style minimal --color 16 --preview 'bat --color=always {}'"
export FZF_CTRL_R_OPTS="--style minimal --color 16 --info inline --no-sort --no-preview"
