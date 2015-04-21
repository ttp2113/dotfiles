# If not running interactively, don't do anything
#[ -z "$PS1" ] && return

# Colored prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# Prompt
#export PS1="\[$(tput setaf 1)\]┌─╼ \[$(tput setaf 6)\][\u@\h: \w]\n\[$(tput setaf 1)\]\$(if [[ \$? == 0 ]]; then echo \"\[$(tput setaf 1)\]└────╼\"; else echo \"\[$(tput setaf 1)\]└╼\"; fi) \$ \[$(tput setaf 6)\]"
export PS1="\[$(tput setaf 3)\]\D{%m/%d %T} [\u@\h: \[$(tput setaf 6)\]\w\[$(tput setaf 3)\]]\n\[$(tput setaf 6)\]\$ \[$(tput setaf 3)\]"
 
# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace
HISTIGNORE="&:ls:cd ~:cd ..:[bf]g:exit:h:history"
 
# append to the history file, don't overwrite it
shopt -s histappend
 
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTFILESIZE="300000"
HISTSIZE="100000"
 

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# prevent accidental exiting from TMUX -- detach instead
exit() {
    if [[ -z $TMUX ]]; then
        builtin exit
    else
        tmux detach
    fi
}

# Color man pages
man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
			man "$@"
}
 
# enable color support of ls and also add handy aliases
export CLICOLOR=1

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

