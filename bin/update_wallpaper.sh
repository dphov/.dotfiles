#!/bin/bash

# Get the current wallpaper path
WALLPAPER_PATH=$(gsettings get org.gnome.desktop.background picture-uri-dark | sed -e 's/^'\''//' -e 's/'\''$//')

# Set wallpaper in variable picture-uri
gsettings set org.gnome.desktop.background picture-uri $WALLPAPER_PATH

# Update the i3 configuration file with the new wallpaper path
sed -i "s|exec_always --no-startup-id feh --bg-scale .*|exec_always --no-startup-id feh --bg-scale '$WALLPAPER_PATH'|" ~/.config/regolith3/i3/config

# Reload the i3 configuration
i3-msg reload

