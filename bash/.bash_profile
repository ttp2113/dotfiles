# .bash_profile

# Get the aliases and functions
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# User specific environment and startup programs
GPG_TTY=$(tty)
export GPG_TTY
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:~/bin

test -e "/Users/ttp/Library/Android/sdk/platform-tools" && export PATH=$PATH:/Users/ttp/Library/Android/sdk/platform-tools
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
test -e "/usr/libexec/java_home" && export JAVA_HOME="$(/usr/libexec/java_home)"
