#!/bin/bash

# Get current brightness percentage (number only, e.g., 45)
CURRENT_BRIGHTNESS=$(brightnessctl | grep -o '(.*' | tr -d '()%')

# If brightness is greater than 5%, decrease by 5%. Otherwise, set to 5%.
if [ "$CURRENT_BRIGHTNESS" -gt 5 ]; then
    brightnessctl set 5%- > /dev/null
else
    brightnessctl set 5% > /dev/null
fi

# Get the new brightness percentage
BRIGHTNESS_VALUE=$(brightnessctl | grep -o '(.*' | tr -d '()')

# Display the new brightness value
echo "$BRIGHTNESS_VALUE"
