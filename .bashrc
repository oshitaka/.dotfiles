#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
#PS1='[\u@\h \W]\$'

PS1="\e[01;32m┏ \e[00m[\e[01;32m\u@\h\e[00m] in \e[01;32m\w\e[00m\n\e[01;32m┗ \e[00m$ "


alias po="sudo shutdown now"
alias rs="sudo reboot"
alias upd="sudo pacman -Syu && sudo paru -Syu"
alias yy="yazi"
alias usb="usbguard list-devices"
alias mnt="sudo mount /dev/sda1 /mnt/disk"
alias umnt="sudo umount /mnt/disk"
alias vi="nvim"
