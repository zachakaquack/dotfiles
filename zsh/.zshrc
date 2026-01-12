# plugins
plugins=(
    git
    z
    fast-syntax-highlighting
)

# load oh my zsh
source $ZSH/oh-my-zsh.sh

# load aliases
[ -f "$XDG_CONFIG_HOME/shell/alias" ] && source "$XDG_CONFIG_HOME/shell/alias"

# load colors from wal
(cat $HOME/.cache/wal/sequences &)
source $HOME/.cache/wal/colors-tty.sh

# compdump location
ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

# history bullshit
HISTFILE=$ZSH/cache/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

setopt HIST_IGNORE_DUPS # ignore dups

# modules
autoload -Uz compinit
compinit
eval "$(zoxide init zsh)" # initialize "z" command (zoxide)

# zstyles
zstyle ':completion:*' special-dirs false # turn off . and ..
zstyle ':omz:update' mode auto # auto update omz
zstyle ':omz:update' frequency 14 # check every 2 weeks (i think lol)

# main opts
setopt append_history inc_append_history share_history # better history
setopt autocd # type name of dir to cd
setopt globdots # include dotfiles in tab complete
setopt no_case_glob no_case_match # case insensitive

# hook to ls every time i change directory
chpwd() {
    ls
}

# source p10k settings
[[ ! -f $XDG_CONFIG_HOME/shell/.p10k.zsh ]] || source $XDG_CONFIG_HOME/shell/.p10k.zsh
# p10k theme
source $ZSH_CUSTOM/themes/powerlevel10k/powerlevel10k.zsh-theme

# thank you bread on penguins for this
# its "(date) (uptime)"
space="  "
echo -e "${NEWLINE}${fg[red]}$(print -P '%D{%_I:%M%P}\n')${space}${fg[blue]}$(uptime -p | cut -c 4-)"

# run hyprland on tty1
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    exec start-hyprland
fi
