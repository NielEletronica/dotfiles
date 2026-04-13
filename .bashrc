#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

#config

cat .cache/wal/sequences # load color scheme

#aliases
alias p='sudo pacman -S'
alias r='sudo pacman -R'
alias u='sudo pacman -Syu'
alias s='sudo pacman -Sy'
