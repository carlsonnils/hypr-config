#!/bin/bash

# Check if shader is currently active
if hyprctl getoption decoration:screen_shader | grep -q "grayscale.frag"; then
    # Disable shader
    hyprctl keyword decoration:screen_shader "[[EMPTY]]"
else
    # Enable shader
    hyprctl keyword decoration:screen_shader "~/.config/hypr/shaders/grayscale.frag"
fi
