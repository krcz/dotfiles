# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

unset PROMPT_COMMAND

trap 'echo -e "\e]0;"; echo -n $BASH_COMMAND; echo -ne "\007"' DEBUG

source "$HOME/.homesick/repos/homeshick/homeshick.sh"
