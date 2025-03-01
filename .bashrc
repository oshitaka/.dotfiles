#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

################
# BISIC TWEAKS #
################ 

# Coloring some commands
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
#PS1='[\u@\h \W]\$'

export TERM=screen-256color

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

#Save command story regadless of windows
shopt -s histappend
PROMPT_COMMAND='history -a'

############
# THEMEING #
############

# Set right alighment 
function git_branch() {
  local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  if [ $? -eq 0 ]; then
    echo "[$branch]"
  else
    echo ""
  fi
}

function right_prompt() {
  local date_time=$(date +'%a, %d %b %H:%M:%S')
  local branch=$(git_branch)
  local left_part="\u@\h in \w" 
  local width=$(( $COLUMNS - ${#left_part} - ${#PWD} +3 ))
  printf "%*s" $width "<< $branch :: $date_time"
}

#PROMPT_COMMAND='right_promt'

# groovebox dark
#PS1='\n\[\e[00;92m\]\u@\h\[\e[m\]\[\e[00;92m\] in \[\e[m\]\[\e[00;92m\]\w\[\e[m\]\[\e[00;92m\] \D{%a, %d %b} \t \[\e[m\]\n\[\e[00;92m\]>_\[\e[m\] '

# groovebox light
#PS1='\n\[\e[00;31m\]\u@\h\[\e[m\]\[\e[00;31m\] in \[\e[m\]\[\e[00;31m\]\w\[\e[m\]\[\e[00;31m\] \D{%a, %d %b} \t \[\e[m\]\n\[\e[00;31m\]>_\[\e[m\] '

# HTB theme
#PS1='\n\u@\h in \w \[$(right_prompt) \t \n>_ '

# cyberpunk theme 
PS1='\n\[\e[00;36m\]\u@\h\[\e[m\] \[\e[00;33m\]in\[\e[m\] \[\e[00;36m\]\w\[\e[m\] \[\e[00;33m\]>>\[\e[m\] \[\e[00;33m\]\[$(right_prompt)\[\e[m\]\n\[\e[00;33m\]>\[\e[m\] '

# minimal theme
#PS2="\e[00;32m>_ "

# cyberpunk colors for tty
if [ "$TERM" = "screen-256color" ]; then
    echo -en "\e]P0141d2b" #black
    echo -en "\e]P87B8097" #darkgrey
    echo -en "\e]P1FF0000" #darkred
    echo -en "\e]P9F02C35" #red
    echo -en "\e]P2f902e7" #darkgreen
    echo -en "\e]PA00FF00" #green
    echo -en "\e]P3E7C630" #darkyellow
    echo -en "\e]PBFFFC4C" #yellow
    echo -en "\e]P4F57800" #darkblue
    echo -en "\e]PC14ffff" #blue
    echo -en "\e]P5f902e7" #magenta
    echo -en "\e]PD9c004b" #darkmagenta
    echo -en "\e]P600FFB3" #cyan
    echo -en "\e]PEFFFC4C" #darkcyan
    echo -en "\e]P7BDC3C7" #lightgrey
    echo -en "\e]PFC1DEFF" #white
    setterm -foreground magenta -store
    clear #for background artifacting
fi

####################
# PERSONAL ALIASES #
####################

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
