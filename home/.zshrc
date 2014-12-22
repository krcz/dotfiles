# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/krcz/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

precmd() { print -Pn "\e]0;%~\a" }
preexec () { print -Pn "\e]0;$1\a" }

PATH="$PATH:$HOME/sistemo/bin"

source "$HOME/.homesick/repos/homeshick/homeshick.sh"
