# .bash_aliases

# Navigation
alias ..='cd ..'
alias ...='cd ../../'

# Overload
alias cp='cp -i'
alias mkdir='mkdir -pv'
alias mv='mv -i'
alias vi='vim'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -lGFh'

# Sorted Size
alias ss='du -cks ./* | sort -rn'

# GPG 
alias decrypt='gpg -d'
alias encrypt='gpg -e -u "ttp2113@columbia.edu" -r "ttp2113@columbia.edu" -r "lh2669@columbia.edu"'
vimdecrypt() { gpg -d "$1" | vim - -n -i "NONE" "+set filetype=$2"; }
alias vimd="vimdecrypt"

# SOCKS proxy for chrome
alias cuproxy='ssh -D 2345 -C -N maestro'

# Add an "alert" alias for long running commands.  Use like so:
# sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Hostname to SSH Alias
alias machine_list="cat ~/.ssh/config | egrep '^Host' | grep -v '\*' | cut -d ' ' -f 2"
SSH=ssh
for MACHINE in `machine_list`
do
    alias $MACHINE="$SSH $MACHINE"
done

# unauthenticated ldap search | Usage: unldap [uni]
## Ensure in new installs that ldap.conf points to the right cert
allldap() {
  ldapsearch -x -H ldaps://ldap.columbia.edu:636 -LLL -b "ou=People,o=Columbia University, c=us" "(uid=$1)"
}

unldap() {
  ldapsearch -x -H ldaps://ldap.columbia.edu:636 -LLL -b "ou=People,o=Columbia University, c=us" "(uid=$1)" | grep -e "cn:" -e "uni:" -e "ou:" -e "title:"
}

# get external IP address
alias whatismyip='wget http://ipinfo.io/ip -qO -'

# iLO Consoles
# You neeed a few things for this to work:
# - Set up /etc/hosts for these addresses or just use localhost in your browser
# - ssh/config file with defined options for the MFA server and Shrimp/ConnServ
# - This has been tested with Firefox 50.1.0 and Java (build 1.8.0_73-b02)
alias macana-console='sudo ssh -L 443:macana-console.cc.columbia.edu:443 -L 23:macana-console.cc.columbia.edu:23 -L 17988:macana-console.cc.columbia.edu:17988 -L 80:macana-console.cc.columbia.edu:80 -L 3389:macana-console.cc.columbia.edu:3389 -L 9300:macana-console.cc.columbia.edu:9300 -L 17990:macana-console.cc.columbia.edu:17990 -L 3002:macana-console.cc.columbia.edu:3002 -N ttp2113@shrimp.cc.columbia.edu'
alias katana-console='sudo ssh -L 443:katana-console.cc.columbia.edu:443 -L 23:katana-console.cc.columbia.edu:23 -L 17988:katana-console.cc.columbia.edu:17988 -L 80:katana-console.cc.columbia.edu:80 -L 3389:katana-console.cc.columbia.edu:3389 -L 9300:katana-console.cc.columbia.edu:9300 -L 17990:katana-console.cc.columbia.edu:17990 -L 3002:katana-console.cc.columbia.edu:3002 -N ttp2113@shrimp.cc.columbia.edu'
alias itak-console='sudo ssh -L 443:itak-console.cc.columbia.edu:443 -L 23:itak-console.cc.columbia.edu:23 -L 17988:itak-console.cc.columbia.edu:17988 -L 80:itak-console.cc.columbia.edu:80 -L 3389:itak-console.cc.columbia.edu:3389 -L 9300:itak-console.cc.columbia.edu:9300 -L 17990:itak-console.cc.columbia.edu:17990 -L 3002:itak-console.cc.columbia.edu:3002 -N ttp2113@shrimp.cc.columbia.edu'
alias talwar-console='sudo ssh -L 443:talwar-console.cc.columbia.edu:443 -L 23:talwar-console.cc.columbia.edu:23 -L 17988:talwar-console.cc.columbia.edu:17988 -L 80:talwar-console.cc.columbia.edu:80 -L 3389:talwar-console.cc.columbia.edu:3389 -L 9300:talwar-console.cc.columbia.edu:9300 -L 17990:talwar-console.cc.columbia.edu:17990 -L 3002:talwar-console.cc.columbia.edu:3002 -N ttp2113@shrimp.cc.columbia.edu'
alias spatha-console='sudo ssh -L 443:spatha-console.cc.columbia.edu:443 -L 23:spatha-console.cc.columbia.edu:23 -L 17988:spatha-console.cc.columbia.edu:17988 -L 80:spatha-console.cc.columbia.edu:80 -L 3389:spatha-console.cc.columbia.edu:3389 -L 9300:spatha-console.cc.columbia.edu:9300 -L 17990:spatha-console.cc.columbia.edu:17990 -L 3002:spatha-console.cc.columbia.edu:3002 -N ttp2113@shrimp.cc.columbia.edu'
alias odachi-console='sudo ssh -L 443:odachi-console.cc.columbia.edu:443 -L 23:odachi-console.cc.columbia.edu:23 -L 17988:odachi-console.cc.columbia.edu:17988 -L 80:odachi-console.cc.columbia.edu:80 -L 3389:odachi-console.cc.columbia.edu:3389 -L 9300:odachi-console.cc.columbia.edu:9300 -L 17990:odachi-console.cc.columbia.edu:17990 -L 3002:odachi-console.cc.columbia.edu:3002 -N ttp2113@shrimp.cc.columbia.edu'
alias dirk-console='sudo ssh -L 443:dirk-console.cc.columbia.edu:443 -L 23:dirk-console.cc.columbia.edu:23 -L 17988:dirk-console.cc.columbia.edu:17988 -L 80:dirk-console.cc.columbia.edu:80 -L 3389:dirk-console.cc.columbia.edu:3389 -L 9300:dirk-console.cc.columbia.edu:9300 -L 17990:dirk-console.cc.columbia.edu:17990 -L 3002:dirk-console.cc.columbia.edu:3002 -N ttp2113@shrimp.cc.columbia.edu'
alias gladius-console='sudo ssh -L 443:gladius-console.cc.columbia.edu:443 -L 23:gladius-console.cc.columbia.edu:23 -L 17988:gladius-console.cc.columbia.edu:17988 -L 80:gladius-console.cc.columbia.edu:80 -L 3389:gladius-console.cc.columbia.edu:3389 -L 9300:gladius-console.cc.columbia.edu:9300 -L 17990:gladius-console.cc.columbia.edu:17990 -L 3002:gladius-console.cc.columbia.edu:3002 -N ttp2113@shrimp.cc.columbia.edu'
alias machete-console='sudo ssh -L 443:machete-console.cc.columbia.edu:443 -L 23:machete-console.cc.columbia.edu:23 -L 17988:machete-console.cc.columbia.edu:17988 -L 80:machete-console.cc.columbia.edu:80 -L 3389:machete-console.cc.columbia.edu:3389 -L 9300:machete-console.cc.columbia.edu:9300 -L 17990:machete-console.cc.columbia.edu:17990 -L 3002:machete-console.cc.columbia.edu:3002 -N ttp2113@shrimp.cc.columbia.edu'
alias rapier-console='sudo ssh -L 443:rapier-console.cc.columbia.edu:443 -L 23:rapier-console.cc.columbia.edu:23 -L 17988:rapier-console.cc.columbia.edu:17988 -L 80:rapier-console.cc.columbia.edu:80 -L 3389:rapier-console.cc.columbia.edu:3389 -L 9300:rapier-console.cc.columbia.edu:9300 -L 17990:rapier-console.cc.columbia.edu:17990 -L 3002:rapier-console.cc.columbia.edu:3002 -N ttp2113@shrimp.cc.columbia.edu'
alias scimitar-console='sudo ssh -L 443:scimitar-console.cc.columbia.edu:443 -L 23:scimitar-console.cc.columbia.edu:23 -L 17988:scimitar-console.cc.columbia.edu:17988 -L 80:scimitar-console.cc.columbia.edu:80 -L 3389:scimitar-console.cc.columbia.edu:3389 -L 9300:scimitar-console.cc.columbia.edu:9300 -L 17990:scimitar-console.cc.columbia.edu:17990 -L 3002:scimitar-console.cc.columbia.edu:3002 -N ttp2113@shrimp.cc.columbia.edu'
alias takoba-console='sudo ssh -L 443:takoba-console.cc.columbia.edu:443 -L 23:takoba-console.cc.columbia.edu:23 -L 17988:takoba-console.cc.columbia.edu:17988 -L 80:takoba-console.cc.columbia.edu:80 -L 3389:takoba-console.cc.columbia.edu:3389 -L 9300:takoba-console.cc.columbia.edu:9300 -L 17990:takoba-console.cc.columbia.edu:17990 -L 3002:takoba-console.cc.columbia.edu:3002 -N ttp2113@shrimp.cc.columbia.edu'
alias vorpal-console='sudo ssh -L 443:vorpal-console.cc.columbia.edu:443 -L 23:vorpal-console.cc.columbia.edu:23 -L 17988:vorpal-console.cc.columbia.edu:17988 -L 80:vorpal-console.cc.columbia.edu:80 -L 3389:vorpal-console.cc.columbia.edu:3389 -L 9300:vorpal-console.cc.columbia.edu:9300 -L 17990:vorpal-console.cc.columbia.edu:17990 -L 3002:vorpal-console.cc.columbia.edu:3002 -N ttp2113@shrimp.cc.columbia.edu'
alias epee-console='sudo ssh -L 443:epee-console.cc.columbia.edu:443 -L 23:epee-console.cc.columbia.edu:23 -L 17988:epee-console.cc.columbia.edu:17988 -L 80:epee-console.cc.columbia.edu:80 -L 3389:epee-console.cc.columbia.edu:3389 -L 9300:epee-console.cc.columbia.edu:9300 -L 17990:epee-console.cc.columbia.edu:17990 -L 3002:epee-console.cc.columbia.edu:3002 -N ttp2113@shrimp.cc.columbia.edu'
alias shiv-console='sudo ssh -L 443:shiv-console.cc.columbia.edu:443 -L 23:shiv-console.cc.columbia.edu:23 -L 17988:shiv-console.cc.columbia.edu:17988 -L 80:shiv-console.cc.columbia.edu:80 -L 3389:shiv-console.cc.columbia.edu:3389 -L 9300:shiv-console.cc.columbia.edu:9300 -L 17990:shiv-console.cc.columbia.edu:17990 -L 3002:shiv-console.cc.columbia.edu:3002 -N ttp2113@shrimp.cc.columbia.edu'
alias razor-console='sudo ssh -L 443:razor-console.cc.columbia.edu:443 -L 23:razor-console.cc.columbia.edu:23 -L 17988:razor-console.cc.columbia.edu:17988 -L 80:razor-console.cc.columbia.edu:80 -L 3389:razor-console.cc.columbia.edu:3389 -L 9300:razor-console.cc.columbia.edu:9300 -L 17990:razor-console.cc.columbia.edu:17990 -L 3002:razor-console.cc.columbia.edu:3002 -N ttp2113@shrimp.cc.columbia.edu'
alias claymore-console='sudo ssh -L 443:claymore-console.cc.columbia.edu:443 -L 23:claymore-console.cc.columbia.edu:23 -L 17988:claymore-console.cc.columbia.edu:17988 -L 80:claymore-console.cc.columbia.edu:80 -L 3389:claymore-console.cc.columbia.edu:3389 -L 9300:claymore-console.cc.columbia.edu:9300 -L 17990:claymore-console.cc.columbia.edu:17990 -L 3002:claymore-console.cc.columbia.edu:3002 -N ttp2113@shrimp.cc.columbia.edu'
alias pata-console='sudo ssh -L 443:pata-console.cc.columbia.edu:443 -L 23:pata-console.cc.columbia.edu:23 -L 17988:pata-console.cc.columbia.edu:17988 -L 80:pata-console.cc.columbia.edu:80 -L 3389:pata-console.cc.columbia.edu:3389 -L 9300:pata-console.cc.columbia.edu:9300 -L 17990:pata-console.cc.columbia.edu:17990 -L 3002:pata-console.cc.columbia.edu:3002 -N ttp2113@shrimp.cc.columbia.edu'
alias hyperbola-console='sudo ssh -L 443:hyperbola-ilo.cul.columbia.edu:443 -L 23:hyperbola-ilo.cul.columbia.edu:23 -L 17988:hyperbola-ilo.cul.columbia.edu:17988 -L 80:hyperbola-ilo.cul.columbia.edu:80 -L 3389:hyperbola-ilo.cul.columbia.edu:3389 -L 9300:hyperbola-ilo.cul.columbia.edu:9300 -L 17990:hyperbola-ilo.cul.columbia.edu:17990 -L 3002:hyperbola-ilo.cul.columbia.edu:3002 -N ttp2113@shrimp.cc.columbia.edu'
alias firehose-console='sudo ssh -L 443:firehose-ilo.cul.columbia.edu:443 -L 23:firehose-ilo.cul.columbia.edu:23 -L 17988:firehose-ilo.cul.columbia.edu:17988 -L 80:firehose-ilo.cul.columbia.edu:80 -L 3389:firehose-ilo.cul.columbia.edu:3389 -L 9300:firehose-ilo.cul.columbia.edu:9300 -L 17990:firehose-ilo.cul.columbia.edu:17990 -L 3002:firehose-ilo.cul.columbia.edu:3002 -N ttp2113@shrimp.cc.columbia.edu'

