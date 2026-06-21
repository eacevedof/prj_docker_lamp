# ~/.bashrc: executed by bash(1) for non-login shells.

[[ -f /etc/bash_completion ]] && . /etc/bash_completion

# verde — identifica frontend visualmente
export PS1="\[\e[38;5;46m\]\u\[\e[38;5;190m\]@\[\e[38;5;121m\]\h \[\e[38;5;195m\]\w \[\033[0m\]$ "

alias home='cd $HOME'

export SHELL=/bin/bash
export LS_OPTIONS='--color=auto'

alias ls='ls $LS_OPTIONS -lat'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'
alias ld='ls $LS_OPTIONS -d */'

alias app='clear && cd /app && ld'
alias pages='clear && cd /app/app && ld'
alias comp='clear && cd /app/core && ld'
alias pub='clear && cd /app/public && ls'

alias ni='npm install'
alias nd='npm run dev'
alias nb='npm run build'
alias nt='npm run test'

aliases() {
    grep '^alias ' ~/.bashrc | sed 's/alias \([^=]*\)=/alias \x1b[93m\1\x1b[0m=/' | sort
}
alias aliases='aliases'

[[ "$PWD" == "/" ]] && cd /app
