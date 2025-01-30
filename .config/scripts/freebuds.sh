#!/bin/bash

# script template called from ld's nvim config

# Declare colors
red='\033[0;31m'
nc='\033[0m'
yellow='\033[1;33m'

#!/bin/bash

# Define the Bluetooth device ID
DEVICE_ID="10:5D:DC:94:1E:24"

# Start bluetoothctl and run commands
{
    echo "connect $DEVICE_ID"  # Connect to the device
    echo "exit"             # Exit bluetoothctl
} | bluetoothctl

echo "Attempted to connect to $DEVICE_ID"

