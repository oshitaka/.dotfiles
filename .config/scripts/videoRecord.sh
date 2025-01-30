#!/bin/bash

# script template called from ld's nvim config

# Declare colors
red='\033[0;31m'
nc='\033[0m'
yellow='\033[1;33m'

pgrep -x "wf-recorder" && pkill -INT -x wf-recorder && notify-send -h string:wf-recorder:record -t 1000 "Finished Recording" && exit 0

notify-send -h string:wf-recorder:record -t 1000 "Recording in:" "<span color='#90a4f4' font='26px'><i><b>3</b></i></span>"

sleep 1

notify-send -h string:wf-recorder:record -t 1000 "Recording in:" "<span color='#90a4f4' font='26px'><i><b>2</b></i></span>"

sleep 1

notify-send -h string:wf-recorder:record -t 950 "Recording in:" "<span color='#90a4f4' font='26px'><i><b>1</b></i></span>"

sleep 1

dateTime=$(date +%m-%d-%Y-%H:%M:%S)
wf-recorder --bframes max_b_frames --audio=alsa_output.pci-0000_00_1f.3.analog-stereo.monitor -g "$(slurp)" -f $HOME/Videos/$dateTime.mp4
