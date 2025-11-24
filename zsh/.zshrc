# p10k instant prompt
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi
#


# VARIALBES
export TERM="kitty"
export TERMINAL="kitty"
export EDITOR="nvim"
export VISUAL="nvim"
export ZSH="$HOME/.oh-my-zsh"
export HYPRSHOT_DIR="/home/zach/Pictures/screenshots"
export CONFIG_DIR="/home/zach/.config"

# path stuff
export PATH="$PATH:$HOME/eww/target/release"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.cargo/bin"

eval "$(zoxide init zsh)"
source ~/powerlevel10k/powerlevel10k.zsh-theme
ZSH_THEME="robbyrussell"
HYPHEN_INSENSITIVE="true"
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 14
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
ENABLE_CORRECTION="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    z
)

source $ZSH/oh-my-zsh.sh
#eval "$(direnv hook zsh)"

# ALIASES
# ls, -C=-columns, -A=list all without dots, -p=write slash after dir, color
alias ls='ls -C -A -p --color=auto --group-directories-first'
alias reload='source ~/.zshrc'
alias q='exit'
alias zshrc='~ && nvim .zshrc'
alias gpp='g++ *.cpp -Wall -fdiagnostics-color=always && ./a.out'

# random
# alias current="swww query | awk '{print $NF}' | head -n 1"
alias current="echo $(swww query | awk '{print $NF}' | head -n 1)"

# all the git shit
alias gs='git status'

dzd() {
    local sel
    sel="$(fd . --type f --type d --hidden | command fzf --height 60% --preview 'bat --style=numbers --color=always --line-range :100 {}')" || return
    [ -d "$sel" ] && cd "$sel" || cd "$(dirname "$sel")"
    echo "Selected File: $(pwd)/$sel\n"
    ls
}

fzf() {
    val="$(pwd)/$(command fzf --height 60% --preview 'bat --style=numbers --color=always --line-range :100 {}')"
    if [ $? -eq 0 ] && [ -n "$val" ]; then
        echo "Selected File: $val"
        cd $(dirname $val)
        nvim "$val"
    fi
}

gzg() {
    local sel
    sel="$(fd . /home/zach --type f --type d --hidden | command fzf --height 60% --preview 'bat --style=numbers --color=always --line-range :100 {}')" || return
    [ -d "$sel" ] && cd "$sel" || cd "$(dirname "$sel")"
    ls
}

# wal stuff
wal-tile() {
    # "$@" is the wallpaper path
    wal -n -i "$@"
    swww img "$@"
    # hyprland
    cp /home/zach/.cache/wal/colors-hyprland.conf /home/zach/.config/hypr/colors.conf && hyprctl reload
    pywal-discord -t default
    pywalfox update
    killall -SIGUSR2 waybar
    swaync-client --reload-css
}
(cat ~/.cache/wal/sequences &)
source ~/.cache/wal/colors-tty.sh

# ?
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# run hyprland
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    exec Hyprland
fi

# startup stuff
if [[ $- == *i* && $TERM == "xterm-kitty" ]]; then
    clear
    # fastfetch
fi
