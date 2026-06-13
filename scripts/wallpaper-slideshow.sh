#!/bin/bash

WALLPAPER_DIR="$HOME/.config/hypr/wallpaper"
INTERVAL=300  # seconds between changes

# Wait until hyprpaper IPC is responsive
# until hyprctl hyprpaper listloaded &>/dev/null; do
#     sleep 0.2
# done
sleep 1

while true; do
    # Get all images in directory
    mapfile -t images < <(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" -o -iname "*.webp" \) | shuf)

    for img in "${images[@]}"; do
        # Preload and set on all monitors
        # hyprctl hyprpaper preload "$img"
        
        for monitor in $(hyprctl monitors -j | jq -r '.[].name'); do
            hyprctl hyprpaper wallpaper "$monitor,$img"
        done
        
        sleep "$INTERVAL"
        
        # Unload to free VRAM
        hyprctl hyprpaper unload "$img"
    done
done
