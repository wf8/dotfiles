# ensure 256 colors
export TERM=xterm-256color

# vi editing mode
set -o vi

if [ "$(uname)" == "Darwin" ]; then

    # details and color when listing files for mac
    alias ls="CLICOLOR_FORCE=1 ls -alhGp"

    # piping ls through less with color for mac
    alias lsl="CLICOLOR_FORCE=1 ls | less -R"

    alias aliview="open -a /Applications/AliView.app"

elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then

    # details and color when listing files for linux
    alias ls="ls -alh --color"

    # piping ls through less with color for linux
    alias lsl="ls | less -R"

fi

# ordered full details when listing processes
alias ps="ps aux"

# human readable disk usage
alias du="du -h"

# human readable disk free space
alias df="df -h"

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

if [ "$(uname)" == "Darwin" ]; then
    PATH="/Users/will/perl5/bin${PATH+:}${PATH}"; export PATH;
    PERL5LIB="/Users/will/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
    PERL_LOCAL_LIB_ROOT="/Users/will/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
    PERL_MB_OPT="--install_base \"/Users/will/perl5\""; export PERL_MB_OPT;
    PERL_MM_OPT="INSTALL_BASE=/Users/will/perl5"; export PERL_MM_OPT;
fi
