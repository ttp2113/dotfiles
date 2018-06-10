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
alias encrypt='gpg -e -u "ttp2113@columbia.edu" -r "ttp2113@columbia.edu" -r "yz2524@columbia.edu" -r "jsp2205@columbia.edu"'
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
alias copymyip="echo $(whatismyip) | pbcopy"

#
# get fingerprint for all keys in an authorized_keys file
fingerprint_keys() {
  if (( $# != 1 )); then
    echo "Usage: ${FUNCNAME} <authorized keys file>" >&2
    return 1
  fi
  local file="$1"
  if [ ! -r "$file" ]; then
    echo "${FUNCNAME}: File '${file}' does not exist or isn't readable." >&2
    return 1
  fi
  # Must be declared /before/ assignment, because of bash weirdness, in
  # order to get exit code in $?.
  local TMPFILE
  TEMPFILE=$(mktemp -q "$1.XXXXXXXXXX")
  if (( $? != 0 )); then
    echo "${FUNCNAME}: Can't create temporary file." >&2
    return 1
  fi

  while read line; do
    # Make sure line isn't a comment or blank.
    if [[ -n "$line" ]] && [ "${line###}" == "$line" ]; then
      # Insert key into temporary file (ignoring noclobber).
      echo "$line" >| "$TEMPFILE"
      # Grab comment from key to distinguish multiple keys
      comment=$(echo ${line} | awk 'BEGIN{FS=" "}; {print($(NF))}')
      echo -n "${comment}: "
      # Fingerprint time.
      ssh-keygen -l -f "$TEMPFILE"

      # Overwrite the file ASAP (ignoring noclobber) to not leave keys
      # sitting in temp files.
      >| "$TEMPFILE"
    fi
  done < "$file"

  rm -f "$TEMPFILE"
  if (( $? != 0 )); then
    echo "${FUNCNAME}: Failed to remove temporary file." >&2
    return 1
  fi
}

# s3 du
# Usage: s3du <bucket name>
s3du() {
  aws s3 ls s3://$1 --recursive  | grep -v -E "(Bucket: |Prefix: |LastWriteTime|^$|--)" | awk 'BEGIN {total=0}{total+=$3}END{print total/1024/1024" MB"}'
}

ansible-role-init() {
  for dir in tasks handlers files default vars templates; do mkdir $dir; done
}

# iLO Consoles
# You neeed a few things for this to work:
# - Set up /etc/hosts for these addresses or just use localhost in your browser
# - ssh/config file with defined options for the MFA server and conservertest/ConnServ
# - This has been tested with Firefox 50.1.0 and Java (build 1.8.0_73-b02)
alias vorpal-console='sudo ssh -L 443:vorpal-console.cc.columbia.edu:443 -L 23:vorpal-console.cc.columbia.edu:23 -L 17988:vorpal-console.cc.columbia.edu:17988 -L 80:vorpal-console.cc.columbia.edu:80 -L 3389:vorpal-console.cc.columbia.edu:3389 -L 9300:vorpal-console.cc.columbia.edu:9300 -L 17990:vorpal-console.cc.columbia.edu:17990 -L 3002:vorpal-console.cc.columbia.edu:3002 -N ttp2113@conservertest.cc.columbia.edu'
alias epee-console='sudo ssh -L 443:epee-console.cc.columbia.edu:443 -L 23:epee-console.cc.columbia.edu:23 -L 17988:epee-console.cc.columbia.edu:17988 -L 80:epee-console.cc.columbia.edu:80 -L 3389:epee-console.cc.columbia.edu:3389 -L 9300:epee-console.cc.columbia.edu:9300 -L 17990:epee-console.cc.columbia.edu:17990 -L 3002:epee-console.cc.columbia.edu:3002 -N ttp2113@conservertest.cc.columbia.edu'
alias shiv-console='sudo ssh -L 443:shiv-console.cc.columbia.edu:443 -L 23:shiv-console.cc.columbia.edu:23 -L 17988:shiv-console.cc.columbia.edu:17988 -L 80:shiv-console.cc.columbia.edu:80 -L 3389:shiv-console.cc.columbia.edu:3389 -L 9300:shiv-console.cc.columbia.edu:9300 -L 17990:shiv-console.cc.columbia.edu:17990 -L 3002:shiv-console.cc.columbia.edu:3002 -N ttp2113@conservertest.cc.columbia.edu'
alias razor-console='sudo ssh -L 443:razor-console.cc.columbia.edu:443 -L 23:razor-console.cc.columbia.edu:23 -L 17988:razor-console.cc.columbia.edu:17988 -L 80:razor-console.cc.columbia.edu:80 -L 3389:razor-console.cc.columbia.edu:3389 -L 9300:razor-console.cc.columbia.edu:9300 -L 17990:razor-console.cc.columbia.edu:17990 -L 3002:razor-console.cc.columbia.edu:3002 -N ttp2113@conservertest.cc.columbia.edu'
alias claymore-console='sudo ssh -L 443:claymore-console.cc.columbia.edu:443 -L 23:claymore-console.cc.columbia.edu:23 -L 17988:claymore-console.cc.columbia.edu:17988 -L 80:claymore-console.cc.columbia.edu:80 -L 3389:claymore-console.cc.columbia.edu:3389 -L 9300:claymore-console.cc.columbia.edu:9300 -L 17990:claymore-console.cc.columbia.edu:17990 -L 3002:claymore-console.cc.columbia.edu:3002 -N ttp2113@conservertest.cc.columbia.edu'
alias pata-console='sudo ssh -L 443:pata-console.cc.columbia.edu:443 -L 23:pata-console.cc.columbia.edu:23 -L 17988:pata-console.cc.columbia.edu:17988 -L 80:pata-console.cc.columbia.edu:80 -L 3389:pata-console.cc.columbia.edu:3389 -L 9300:pata-console.cc.columbia.edu:9300 -L 17990:pata-console.cc.columbia.edu:17990 -L 3002:pata-console.cc.columbia.edu:3002 -N ttp2113@conservertest.cc.columbia.edu'
alias firehose-console='sudo ssh -L 443:firehose-ilo.cul.columbia.edu:443 -L 23:firehose-ilo.cul.columbia.edu:23 -L 17988:firehose-ilo.cul.columbia.edu:17988 -L 80:firehose-ilo.cul.columbia.edu:80 -L 3389:firehose-ilo.cul.columbia.edu:3389 -L 9300:firehose-ilo.cul.columbia.edu:9300 -L 17990:firehose-ilo.cul.columbia.edu:17990 -L 3002:firehose-ilo.cul.columbia.edu:3002 -N ttp2113@conservertest.cc.columbia.edu'
