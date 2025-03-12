#!/usr/bin/env bash
# mic-toggle.sh: Toggle microphone mute state using pactl

# Get the default source (microphone) index:
default_source=$(pactl info | awk -F": " '/^Default Source/ {print $2}')

# Get the mute state for the default source:
mute_state=$(pactl list sources | awk -v src="$default_source" '
  BEGIN {RS=""; FS="\n"}
  $0 ~ src {
    for(i=1;i<=NF;i++){
      if($i ~ /Mute:/){
        print $i;
        exit
      }
    }
  }')

# Extract current mute value ("yes" or "no")
mute_value=$(echo "$mute_state" | awk '{print $2}')

if [ "$mute_value" = "no" ]; then
    # Mute the microphone
    pactl set-source-mute "$default_source" 1
else
    # Unmute the microphone
    pactl set-source-mute "$default_source" 0
fi
