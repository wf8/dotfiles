# ensure 256 colors
export TERM=xterm-256color

# vi editing mode
set -o vi

# details and color when listing files for mac
#alias ls="CLICOLOR_FORCE=1 ls -alhGp"

# piping ls through less with color for mac
#alias lsl="CLICOLOR_FORCE=1 ls | less -R"

# details and color when listing files for linux
alias ls="ls -alh --color"

# piping ls through less with color for linux
alias lsl="ls | less -R"

# ordered full details when listing processes
alias ps="ps aux"

# human readable disk usage
alias du="du -h"

# set prompt:
# \[ \] = surrounds non printing characters
export PS1="\[\e]0;\u@\h: \w\a\]\[\e]0;\u@\h:\w\a\]\[\033[00;33m\]\u@\h\[\033[00m\]:\[\033[00;34m\]\w\[\033[00m\]$ "

# old prompts:
# export PS1="\[\e[0;31m\][\u@\h:\w]\$\[\e[m\] "
# export PS1="\[\e[0;31m\]\h:\W \u\$\[\e[m\] "

# method to change tmux window title
settitle() {
    printf "\033k$1\033\\"
}

# change tmux window title for ssh
ssh() {
    settitle "$*"
    command ssh "$@"
    settitle "bash"
}

# change tmux window title for htop
htop() {
    settitle "htop"
    command htop "$@"
    settitle "bash"
}
