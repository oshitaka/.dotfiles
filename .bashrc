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
export VIRTUAL_ENV_DISABLE_PROMPT=1
export PATH="$HOME/.cargo/bin:$PATH"

# fzf config
eval "$(fzf --bash)"
export FZF_TMUX=1
export FZF_DEFAULT_OPTS="
  --cycle \
  --reverse \
  --multi \
  --ansi \
  --bind 'ctrl-y:execute-silent(printf {} | cut -f 2- | wl-copy --trim-newline)'
"

#Save command story regadless of windows
shopt -s histappend
PROMPT_COMMAND='history -a'

############
# THEMEING #
############

# display additional info
function git_branch() {
  local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  local color_branch="\033[0;32m"
  local color_on="\033[0;33m"
  local color_reset="\033[0m"
  if [ -n "$branch" ]; then
    echo -e " ${color_on}on${color_reset} ${color_branch} ${branch}${color_reset}"
  fi
}

function venv() {
  local color="\033[0;32m"
  local color_via="\033[0;33m"
  local color_reset="\033[0m"
  if [[ -n "$VIRTUAL_ENV" ]]; then
    echo -e " ${color_via}via${color_reset} ${color} $(basename $VIRTUAL_ENV)${color_reset}";
  fi
}

function battery() {
    # Check if battery information exists
  if [ -f /sys/class/power_supply/BAT0/capacity ]; then
    # Read the percentage value
    capacity=$(cat /sys/class/power_supply/BAT0/capacity)
    echo "${capacity}%"
  fi
}

function active_vpn() {
  local active_vpn=$(nmcli connection show --active | grep -E 'wg0|Openconnect')
  local color="\033[0;32m"
  local color_reset="\033[0m"
  if [[ -n "$active_vpn" ]]; then
    echo -e " ${color}VPN${color_reset}"
  fi
}

# minimal theme
#PS1="\e[00;32m>_ "

# groovebox dark
#PS1='\n\[\e[00;92m\]\u@\h\[\e[m\]\[\e[00;92m\] in \[\e[m\]\[\e[00;92m\]\w\[\e[m\]\[\e[00;92m\] \D{%a, %d %b} \t \[\e[m\]\n\[\e[00;92m\]>_\[\e[m\] '

# groovebox light
#PS1='\n\[\e[00;31m\]\u@\h\[\e[m\]\[\e[00;31m\] in \[\e[m\]\[\e[00;31m\]\w\[\e[m\]\[\e[00;31m\] \D{%a, %d %b} \t \[\e[m\]\n\[\e[00;31m\]>_\[\e[m\] '

# HTB theme
#PS1='\n\u@\h in \w :: \t \n>_ '

# cyberpunk theme 
PS1='\n\[\e[00;34m\]\u@\h\[\e[m\] \[\e[00;33m\]in\[\e[m\] \[\e[00;34m\]\w\[\e[m\]$(git_branch)$(venv) \[\e[00;33m\]..::\[\e[m\]\[\e[00;33m\]\D{%a, %d %b} \t::..\[\e[m\] [$(battery)$(active_vpn)]\n\[\e[00;33m\]>\[\e[m\] '

# cyberpunk colors for tty
if [ "$TERM" = "screen-256color" ]; then
    echo -en "\e]P0141d2b" #black
    echo -en "\e]P87B8097" #darkgrey
    echo -en "\e]P1F02C35" #darkred
    echo -en "\e]P9FF0000" #red
    echo -en "\e]P200FF00" #darkgreen
    echo -en "\e]PA00FF00" #green
    echo -en "\e]P3E7C630" #darkyellow
    echo -en "\e]PBFFFC4C" #yellow
    echo -en "\e]P4ff3bf1" #darkblue
    echo -en "\e]PCFFFC4C" #blue
    echo -en "\e]P514ffff" #darkmagenta 
    echo -en "\e]PDff3bf1" #magenta
    echo -en "\e]P600FFB3" #darkcyan
    echo -en "\e]PE00FFB3" #cyan
    echo -en "\e]P7BDC3C7" #lightgrey
    echo -en "\e]PFC1DEFF" #white
    setterm -term linux -foreground magenta -store
    clear #for background artifacting
fi

####################
# PERSONAL ALIASES #
####################

alias po="sudo shutdown now"
alias rb="sudo reboot now"
alias upd="sudo pacman -Syu && paru -Syu"
alias yy="yazi"
alias usb="usbguard list-devices | grep 'block'"
alias mnt="sudo mount /dev/sda1 /mnt/disk"
alias umnt="sudo umount /mnt/disk"
alias vi="nvim"
alias tnl="ssh -p 321 -C2 -D 1080 oshi@206.188.196.102"
alias tru="ssh -C2 -D 1081 -i /home/oshitaka/.ssh/cloudru_ed25519_key oshi@82.202.136.33"
alias bt="bluetoothctl"
alias btoff="bash ~/.config/scripts/bluetooth_off.sh"
alias hp="bash ~/.config/scripts/freebuds.sh"
alias ip="ip address show"
alias nm="nmtui"
alias srv="ssh oshi@206.188.196.102 -p 321"
alias hib="systemctl hibernate"
alias usba="sudo usbguard allow-device"
alias open="ouch decompress"
alias HH="Hyprland"
alias del="sudo pacman -Runs"
alias cloud="ssh -i /home/oshitaka/.ssh/cloudru_ed25519_key oshi@82.202.136.33"
alias tsql="ssh -i /home/oshitaka/.ssh/cloudru_ed25519_key -L 3307:localhost:3306 oshi@82.202.136.33"
alias connect="sudo openconnect oshitaka.duckdns.org/?placebehindthewall -u main"
alias icat="kitten icat"
alias d="kitten diff"
alias panel="kitty +kitten panel --edge=background"
alias dotfiles="git --work-tree=$HOME --git-dir=$HOME/.dotfiles/"
alias savebat="echo 1 > /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode"
alias normalbat="echo 0 > /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode"
alias t="tmux new -s main"
alias tkill="tmux kill-server"
alias homelab="ssh oshi@10.10.10.4"
alias webserver="ssh oshi@10.10.10.5 -i /home/oshitaka/.ssh/cloudru_ed25519_key"
#RUST PATH
#. "$HOME/.cargo/env"

# uv PATH and autocompletion
. "$HOME/.local/bin/env"
eval "$(uv generate-shell-completion bash)"
