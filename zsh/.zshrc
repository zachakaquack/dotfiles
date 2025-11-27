# if [[ -r ~/.p10k.zsh ]]; then
#     source ~/.p10k.zsh
# fi
source $ZSH/oh-my-zsh.sh

(cat ~/.cache/wal/sequences &)
source ~/.cache/wal/colors-tty.sh


# VARIALBES
export TERM="kitty"
export TERMINAL="kitty"
export EDITOR="nvim"
export VISUAL="nvim"
export ZSH="$HOME/.oh-my-zsh"
export HYPRSHOT_DIR="$HOME/Pictures/screenshots"
export CONFIG_DIR="$HOME/.config"

# path stuff
export PATH="$PATH:$HOME/eww/target/release"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.cargo/bin"

# zsh
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
HISTSIZE=2000
SAVEHIST=2000
HISTFILE=$ZSH/cache/.zsh_history

# fzf search history (remove the bind then rebind to the fzf script)
bindkey -r "^r"
bindkey -s "^r" "$HOME/scripts/fzf_scripts/fzf_history.sh^M"

# other rnadom settings /stuff
eval "$(zoxide init zsh)"

# complete hidden files in tab
# compinit
_comp_options+=(globdots)

# dont show . and .. when complete with tab
zstyle ':completion:*' special-dirs false

zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 14

# thank you bread on penguins for this
# "its (date) (uptime) (removed username / hostname)"
echo -e "${NEWLINE}\x1b[38;5;137m\x1b[48;5;0m it's$(print -P '%D{%_I:%M%P}\n') \x1b[38;5;180m\x1b[48;5;0m $(uptime -p | cut -c 4-)" # current

HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"

plugins=(
    git
    z
)


# ALIASES
# ls, -C=-columns, -A=list all without dots, -p=write slash after dir, color
alias ls='ls -C -A -p --color=auto --group-directories-first'
alias reload='source ~/.zshrc'
alias q='exit'
alias zshrc='nvim $HOME/dotfiles/zsh/.zshrc'
alias gpp='g++ *.cpp -Wall -fdiagnostics-color=always && ./a.out'

# random
alias current="$HOME/scripts/current_theme.sh"
alias backupdots="/bin/bash -e '$HOME/dotfiles/backup.sh'"
alias calc='kalker'

# all the git shit
alias gs='git status'

# wal stuff
# this used to be the script itself, but it's kept in the zshrc as a function for backwards compatibility
wal-tile() {
    $HOME/scripts/wal-tile.sh $@
}

# source p10k settings
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# THEMES
source ~/powerlevel10k/powerlevel10k.zsh-theme


# run hyprland
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    exec Hyprland
fi
