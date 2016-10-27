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


### Powerline Config
#if [ -f /usr/local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh ]; then
#    source /usr/local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
#fi
### End Powerline
