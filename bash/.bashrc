# If not running interactively, don't do anything
#[ -z "$PS1" ] && return

# Source global definitions first
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

## Colors
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	color_prompt=yes
    else
	color_prompt=
    fi
fi

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
 
# enable color support
export CLICOLOR=1

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

## Prompt Customization
export PS1="\[$(tput setaf 1)\]\D{%m/%d %T} [\u@\h: \[$(tput setaf 6)\]\w\[$(tput setaf 1)\]]\n\[$(tput setaf 6)\]\$ \[$(tput setaf 1)\]\[$(tput sgr0)\]"

## History Customization 
# don't put duplicate lines in the history
# or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace
HISTIGNORE="&:clear:ls:cd ~:cd ..:[bf]g:exit:h:history"
# append to the history file, don't overwrite it
shopt -s histappend
# set history length
HISTFILESIZE=300000
HISTSIZE=100000
 
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
