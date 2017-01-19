export WORKON_HOME=/home/flangevin/virtual_env/
source /usr/local/bin/virtualenvwrapper.sh

source /etc/bash_completion
shopt -s histappend
export HISTSIZE=10000
PROMPT_COMMAND='history -a; history -n'

if [ "$TERM" != "dumb" ]; then
    [ -e "$HOME/.dir_colors" ] &&
    DIR_COLORS="$HOME/.dir_colors" [ -e "$DIR_COLORS" ] ||
    DIR_COLORS=""
    eval "`dircolors -b $DIR_COLORS`"
    alias ls='ls --color=auto'
fi

alias la='ls -Fa'
alias ll='ls -Fls'
alias cdve='cd $VIRTUAL_ENV'
alias ag="LESS='FSRX' ag --pager less"

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

DEFAULT="[37;1m"
PINK="[35;1m"
GREEN="[32;1m"
ORANGE="[33;1m"
BLUE="[36;1m"
RED="[31;1m"
BOLD="[1m"
OFF="[m"

# Add git branch if its present to PS1
parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
 PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]$(parse_git_branch)\[\033[00m\]\$ '

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
