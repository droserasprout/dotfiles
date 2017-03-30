ZSH=/usr/share/oh-my-zsh/
ZSH_THEME="robbyrussell"
DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"

plugins=(battery colorize colored-man-pages common-aliases cp extract history-substring-search nyan sudo)

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

EDITOR=nano   
VISUAL=$EDITOR
export EDITOR VISUAL

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

bindkey "^[[2~" yank
bindkey "^[[3~" delete-char
bindkey "^[[5~" up-line-or-history
bindkey "^[[6~" down-line-or-history
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey "^[e" expand-cmd-path ## C-e for expanding path of typed command
bindkey "^[[A" up-line-or-search ## up arrow for back-history-search
bindkey "^[[B" down-line-or-search ## down arrow for fwd-history-search
bindkey " " magic-space ## do history expansion on space

zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' expand suffix
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/drsrsprt/.zshrc'
autoload -Uz compinit
compinit

ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

alias 'stop'='sudo systemctl stop'
alias 'start'='sudo systemctl start'
alias 'restart'='sudo systemctl restart'
alias 'status'='sudo systemctl status'
alias 'ps'='ps -ef | grep -i '
alias 'beet'='beet -v'
alias 'syu'='pacaur -Syu && paccache -rk 2 && du -sh /var/cache/pacman'
