# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' frequency 14

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

plugins=(
	git
	z
  # zsh-autocomplete
)

source $ZSH/oh-my-zsh.sh
eval "$(direnv hook zsh)"


alias reload='source ~/.zshrc'
alias q='exit'
alias remicon='~/scripts/remove_icon.sh'
alias lines='git ls-files | xargs wc -l'
alias gpp='echo "COMMAND: g++ {FILENAME}.cpp && ./a.out"'
alias notetoday='nvim $(date -I).txt'
alias nvimcpp='mkdir $(date +"%Y-%m-%d") -p && cd $(date +"%Y-%m-%d") && touch $(date +"%Y-%m-%d").cpp && nvim $(date +"%Y-%m-%d").cpp'
alias fake-vesktop='gdbus call --session \
  --dest org.freedesktop.Notifications \
  --object-path /org/freedesktop/Notifications \
  --method org.freedesktop.Notifications.Notify \
  "vesktop" 42 "vesktop" "Fake Vesktop" "Hello, this is a test notification." '\''[]'\'' '\''{}'\'' 1000'
alias zshrc='~ && nvim .zshrc'
alias gpp='~/scripts/build_and_run.sh'

wal-tile() {
    wal -n -i "$@"
    # feh --bg-tile "$(< "${HOME}/.cache/wal/wal")"
    waypaper --wallpaper "$@"
    python ~/scripts/py/copy_hyprland_colors.py "$@"
}
# keep the tty consistent
(cat ~/.cache/wal/sequences &)
source ~/.cache/wal/colors-tty.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
if [[ $- == *i* && $TERM == "xterm-kitty" ]]; then

  # /home/zach/scripts/random_fastfetch_logo.sh
  clear
  fastfetch
fi
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export CONFIG_DIR=/home/zach/.config
export EDITOR=nvim

# eww
export PATH="$HOME/eww/target/release:$PATH"
# Created by `pipx` on 2025-06-15 13:27:28
export PATH="$PATH:/home/zach/.local/bin"

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  exec Hyprland
fi
