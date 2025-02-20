#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
#PS1='[\u@\h \W]\$'

export TERM="screen-256color"

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

#groovebox dark
#PS1='\n\[\e[00;92m\]\u@\h\[\e[m\]\[\e[00;92m\] in \[\e[m\]\[\e[00;92m\]\w\[\e[m\]\[\e[00;92m\] \D{%a, %d %b} \t \[\e[m\]\n\[\e[00;92m\]>_\[\e[m\] '

#groovebox light
PS1='\n\[\e[00;31m\]\u@\h\[\e[m\]\[\e[00;31m\] in \[\e[m\]\[\e[00;31m\]\w\[\e[m\]\[\e[00;31m\] \D{%a, %d %b} \t \[\e[m\]\n\[\e[00;31m\]>_\[\e[m\] '

#HTB theme
PS1='\n\u@\h in \w \D{%a, %d %b} \t \n>_ '

#PS1="\e[01;32m┏ \e[00m[\e[01;32m\u@\h\e[00m] in \e[01;32m\w\e[00m\n\e[01;32m┗━ \e[00m$ "
#PS1="\n\e[01;32m\u@\h\e[00m \e[00;33min\e[00m \e[01;32m\w\e[00m \e[00;33m\❱_\e[00m "
#PS1="\n\e[00;32m\e[00m\e[00;32m\u@\h\e[00m \e[00;33min\e[00m \e[00;32m\w\e[00m\n\e[00;33m❱_\e[00m "
#PS2="\e[00;32m>_ "

#Save command story regadless od windows
shopt -s histappend
PROMPT_COMMAND='history -a'


alias po="sudo shutdown now"
alias rb="sudo reboot"
alias upd="sudo pacman -Syu && paru -Syu"
alias yy="yazi"
alias usb="usbguard list-devices"
alias mnt="sudo mount /dev/sda1 /mnt/disk"
alias umnt="sudo umount /mnt/disk"
alias vi="nvim"
alias tun="ssh -p 321 -C2 -D 1080 oshi@206.188.196.102"
alias bt="bluetoothctl"
alias ipa="ip address show"
alias nm="nmtui"
alias srv="ssh oshi@206.188.196.102 -p 321"
alias hib="systemctl hibernate"
alias usba="sudo usbguard allow-device"
alias open="ouch decompress"
alias HH="Hyprland"
alias del="sudo pacman -Runsc"
alias cloud="ssh -i /home/oshitaka/.ssh/id_ed25519_cloudru user@176.108.251.97"
alias connect="sudo openconnect oshitaka.duckdns.org/?placebehindthewall -u main"
alias icat="kitten icat"
alias d="kitten diff"
alias panel="kitty +kitten panel --edge=background"
alias dotfiles="git --work-tree=$HOME --git-dir=$HOME/.dotfiles/"
alias savebat="echo 1 > /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode"
alias normalbat="echo 0 > /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode"
