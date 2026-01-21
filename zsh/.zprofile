# default programs
export EDITOR="nvim"
export VISUAL="nvim"

# source some private stuff (like wttr location)
[ -f "$HOME/.private_keys" ] && source "$HOME/.private_keys"

# xdg stuff
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# get rid of the annoying zcompdump stuff
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

# path
path=(
    $path # for previous entries
    $HOME/.local/bin
    $HOME/.cargo/bin
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

# fzf stuff
export FZF_DEFAULT_OPTS="--style minimal --color 16 --preview 'bat --color=always {}'"
export FZF_CTRL_R_OPTS="--style minimal --color 16 --info inline --no-sort --no-preview"
