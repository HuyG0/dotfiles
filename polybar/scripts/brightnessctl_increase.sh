#!/bin/bash

# Get current brightness percentage (number only)
CURRENT_BRIGHTNESS=$(brightnessctl | grep -o '(.*' | tr -d '()%')

# If brightness is less than 100%, increase by 5%. Otherwise, cap at 100%.
if [ "$CURRENT_BRIGHTNESS" -lt 100 ]; then
    brightnessctl set +5% > /dev/null
else
    brightnessctl set 100% > /dev/null
fi

# Get the new brightness percentage
BRIGHTNESS_VALUE=$(brightnessctl | grep -o '(.*' | tr -d '()')

# Display the new brightness value
echo "$BRIGHTNESS_VALUE"
