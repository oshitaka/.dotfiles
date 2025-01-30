#!/usr/bin/bash

ip=$(curl -s ifconfig.me)
if [[ $ip == "206.188.196.102" ]]; then
  # If the IP matches, set the color to green
  echo "{\"text\": \"$ip 󰌾\", \"class\": \"ip-match\", \"tooltip\":\"secure\"}"
elif [[ $ip == "" ]]; then
  # If the IP matches, set the color to green
  echo "{\"text\": \"OFFLINE\", \"class\": \"ip-noip\", \"tooltip\":\"No internet\"}"
else
  # If the IP does not match, set the color to red
  echo "{\"text\": \"$ip 󰿆\", \"class\": \"ip-mismatch\", \"tooltip\":\"not secure!\"}"
fi
