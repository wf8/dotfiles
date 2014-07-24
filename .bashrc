# vi editing mode
set -o vi

# details and color when listing files
alias ls="CLICOLOR_FORCE=1 ls -aoGp"

# piping ls through less with color
alias lsl="CLICOLOR_FORCE=1 ls | less -R"

# ordered full details when listing processes
alias ps="ps aux"

# set prompt:
# \[ \] = surrounds non printing characters
export PS1="\[\e]0;\u@\h: \w\a\]\[\e]0;\u@\h:\w\a\]\[\033[00;33m\]\u@\h\[\033[00m\]:\[\033[00;34m\]\w\[\033[00m\]$ "

# old prompts:
# export PS1="\[\e[0;31m\][\u@\h:\w]\$\[\e[m\] "
# export PS1="\[\e[0;31m\]\h:\W \u\$\[\e[m\] "

