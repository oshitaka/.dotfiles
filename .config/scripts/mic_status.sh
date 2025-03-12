#!/usr/bin/env bash
# mic-status.sh: Output a custom icon based on the current mute status

# Get the default source (microphone) index:
default_source=$(pactl info | awk -F": " '/^Default Source/ {print $2}')

# Get mute status:
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

mute_value=$(echo "$mute_state" | awk '{print $2}')

# Choose icon: You can replace these with your preferred icons, for example from Font Awesome.
if [ "$mute_value" = "yes" ]; then
    # Microphone muted
    echo ""  # Example icon for muted microphone
else
    # Microphone active
    echo ""  # Example icon for active microphone
fi
