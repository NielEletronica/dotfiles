#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
cd
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ps='sudo pacman -S'
alias update='sudo pacman -Sy'
alias upgrade='sudo pacman -Syu'
alias p='sudo pacman'
PS1='[\u@\h \W]\$ '
stty -ixon
