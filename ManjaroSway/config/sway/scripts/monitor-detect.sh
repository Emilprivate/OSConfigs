#!/bin/bash

CONNECTED_MONITORS=$(swaymsg -t get_outputs | grep -E "Model: AOC 24B2W1 0x00004038|Model: Acer Technologies Acer XB240H T1YEE0114202|Model: Acer Technologies XF270HU T78EE0048521")

if [ ! -z "$CONNECTED_MONITORS" ]; then
    kanshi aalborg-homesetup
fi

