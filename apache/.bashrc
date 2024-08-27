# ~/.bashrc: executed by bash(1) for non-login shells.

# Note: PS1 and umask are already set in /etc/profile. You should not
# need this unless you want different defaults for root.
# PS1='${debian_chroot:+($debian_chroot)}\h:\w\$ '
# umask 022

# You may uncomment the following lines if you want `ls' to be colorized:
#
# Some more alias to avoid making mistakes:
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'

# ===========
# @eaf
# ===========
export PS1="\[\e[38;5;46m\]\u\[\e[38;5;190m\]@\[\e[38;5;121m\]\h \[\e[38;5;195m\]\w \[\033[0m\]$ "

alias home='cd $HOME'

export SHELL=/bin/bash
export LS_OPTIONS='--color=auto'
eval "$(dircolors)"

alias ls='ls $LS_OPTIONS -lat'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'
alias ld='ls $LS_OPTIONS -d */'

alias www='clear && cd /var/www && ld'
alias tmp='clear && cd /tmp && ls'
alias logs='clear && cd /var/www/logs && ls'

#apps
alias app-reporting='clear && cd /var/www/app-reporting && ld'
alias app-ticketing-api='clear && cd /var/www/app-ticketing-api && ld'

apps() {
    ls -d /var/www/app-*/ | sed 's|/var/www/\(.*\)/|\x1b[92m\1\x1b[0m|' | awk '{for (i=9; i<=NF; i++) printf $i " "; print ""}' | sed 's|app-||' | sort
}
alias apps='apps'

go-app() {
    local app_name="$1"
    clear && cd "/var/www/app-$app_name/www/html" && ls
}
alias go-app='go-app'

aliases() {
    grep '^alias ' ~/.bashrc | sed 's/alias \([^=]*\)=/alias \x1b[93m\1\x1b[0m=/' | sort
}
alias aliases='aliases'

cd /var/www/