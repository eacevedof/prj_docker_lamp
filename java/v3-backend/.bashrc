# ~/.bashrc: executed by bash(1) for non-login shells.

[[ -f /etc/bash_completion ]] && . /etc/bash_completion

# azul — identifica saas/backend visualmente
export PS1="\[\e[38;5;39m\]\u\[\e[38;5;190m\]@\[\e[38;5;121m\]\h \[\e[38;5;195m\]\w \[\033[0m\]$ "

alias home='cd $HOME'

export SHELL=/bin/bash
export LS_OPTIONS='--color=auto'
eval "$(dircolors)"

alias ls='ls $LS_OPTIONS -lat'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'
alias ld='ls $LS_OPTIONS -d */'

alias app='clear && cd /app && ld'
alias src='clear && cd /app/src/main/java && ld'
alias res='clear && cd /app/src/main/resources && ls'
alias upl='clear && cd /app/uploads && ld'

alias m='./mvnw'
alias mc='./mvnw compile -q'
alias mt='./mvnw test'
alias mco='./mvnw clean'

aliases() {
    grep '^alias ' ~/.bashrc | sed 's/alias \([^=]*\)=/alias \x1b[93m\1\x1b[0m=/' | sort
}
alias aliases='aliases'

[[ "$PWD" == "/" ]] && cd /app
