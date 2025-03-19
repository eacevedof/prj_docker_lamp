# ===========
# @eaf
# ===========
# https://robotmoon.com/bash-prompt-generator/
export PS1="\[\e[38;5;46m\]\u\[\e[38;5;190m\]@\[\e[38;5;121m\]\h \[\e[38;5;195m\]\w \[\033[0m\]$ "

alias home='cd $HOME'

export SHELL=/bin/bash
export LS_OPTIONS='--color=auto'
eval "$(dircolors)"

alias ls='ls $LS_OPTIONS -lat'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'
alias ld='ls $LS_OPTIONS -d */'

alias www='clear && cd /www && ld'
alias tmp='clear && cd /tmp && ls'
alias logs='clear && cd /www/logs && ls'

#apps
alias app-reporting='clear && cd /www/app-reporting && ld'

apps() {
    ls -d /www/app-*/ | sed 's|/www/\(.*\)/|\x1b[92m\1\x1b[0m|' | awk '{for (i=9; i<=NF; i++) printf $i " "; print ""}' | sed 's|app-||' | sort
}
alias apps='apps'

app() {
    local app_name="$1"
    clear && cd "/www/app-$app_name/www/html" && ls
}
alias app='app'

aliases() {
    grep '^alias ' ~/.bashrc | sed 's/alias \([^=]*\)=/alias \x1b[93m\1\x1b[0m=/' | sort
}
alias aliases='aliases'

cd /www/