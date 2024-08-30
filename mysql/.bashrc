export PS1="\[\e[38;5;46m\]\u\[\e[38;5;190m\]@\[\e[38;5;121m\]\h \[\e[38;5;195m\]\w \[\033[0m\]$ "

alias home='cd $HOME'

export SHELL=/bin/bash
export LS_OPTIONS='--color=auto'
eval "$(dircolors)"

alias ls='ls $LS_OPTIONS -lat'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'
alias ld='ls $LS_OPTIONS -d */'

alias sql='mysql -u root -proot -e "show databases;"'
alias my-conf='clear && cd /etc/mysql && ll'
alias my-data='clear && cd /var/lib/mysql && ll'

clear
cat /etc/mysql/conf.d/my-8-0-24.cnf
cd /etc/mysql && ll

