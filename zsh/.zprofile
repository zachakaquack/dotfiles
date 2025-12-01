# default programs
export EDITOR="nvim"

# source some private stuff (like wttr location)
[ -f "$HOME/.private_keys" ] && source "$HOME/.private_keys"

# xdg stuff
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# path
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.cargo/bin"

# random
export HYPRSHOT_DIR="$HOME/Pictures/screenshots"
export ZSH="$HOME/.oh-my-zsh"
export SCRIPTS="$HOME/scripts"

# no idea if these even do anything lol
export TERM="kitty"
export TERMINAL="kitty"
export EDITOR="nvim"
export VISUAL="nvim"
export CONFIG_DIR="$HOME/.config"

# fzf stuff
export FZF_DEFAULT_OPTS="--style minimal --color 16 --preview 'bat --color=always {}'"
export FZF_CTRL_R_OPTS="--style minimal --color 16 --info inline --no-sort --no-preview"
