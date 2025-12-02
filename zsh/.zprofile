# default programs
export EDITOR="nvim"
export VISUAL="nvim"
export TERM="kitty"
export BROWSER="librewolf"

# source some private stuff (like wttr location)
[ -f "$HOME/.private_keys" ] && source "$HOME/.private_keys"

# xdg stuff
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# path
# export PATH="$PATH:$HOME/.local/bin"
# export PATH="$PATH:$HOME/.cargo/bin"
path=(
    $path # for previous entries
    $HOME/.local/bin
    $HOME/.cargo/bin
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
