# instant prompt or whatever
if [[ -r ~/.p10k.zsh ]]; then
    source ~/.p10k.zsh
fi

# load oh my zsh
source $ZSH/oh-my-zsh.sh

# load aliases
[ -f "$HOME/.config/shell/alias" ] && source "$HOME/.config/shell/alias"

# load colors from wal
(cat ~/.cache/wal/sequences &)
source ~/.cache/wal/colors-tty.sh

# zsh
ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
HISTFILE=$ZSH/cache/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# fzf search history (remove the bind then rebind to the fzf script)
bindkey -r "^r"
bindkey -s "^r" "$HOME/scripts/fzf_scripts/fzf_history.sh^M"

# initialize "z" command (zoxide)
eval "$(zoxide init zsh)"

# complete hidden files in tab
# compinit
_comp_options+=(globdots)
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"

# dont show . and .. when complete with tab
zstyle ':completion:*' special-dirs false

# update frequency for oh-my-zsh
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 14

plugins=(
    git
    z
)

# source p10k settings with its theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ~/powerlevel10k/powerlevel10k.zsh-theme

# thank you bread on penguins for this
# "its (date) (uptime)"
space="  "
echo -e "${NEWLINE}${fg[red]}$(print -P '%D{%_I:%M%P}\n')${space}${fg[blue]}$(uptime -p | cut -c 4-)"

# run hyprland on tty1
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    exec Hyprland
fi
