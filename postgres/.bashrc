export PS1="\[\e[38;5;46m\]\u\[\e[38;5;190m\]@\[\e[38;5;121m\]\h \[\e[38;5;195m\]\w \[\033[0m\]$ "

alias home='cd $HOME'

export SHELL=/bin/bash
export LS_OPTIONS='--color=auto'
eval "$(dircolors)"

alias ls='ls $LS_OPTIONS -lat'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'
alias ld='ls $LS_OPTIONS -d */'

alias pg-root='clear && psql -U postgres -c "\l" && psql -U postgres'
alias pg-conf='clear && cd /etc/postgressql && ll && cat /var/lib/postgresql/data/postgresql.conf'
alias pg-data='clear && cd /var/lib/postgresql/data && ll'
alias pg-vars='clear && psql -U postgres -c "SHOW ALL;" -h localhost -d db_vector > /tmp/postgres-vars.sql && cat /tmp/postgres-vars.sql'
alias tmp='clear && cd /tmp && ll'

clear
pg-root

