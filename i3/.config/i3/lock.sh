#!/usr/bin/env bash

# lock.sh - Wrapper do i3lock-color baseado na config antiga do Hyprlock

# O i3lock-color usa o formato Hexadecimal RRGGBBAA (Red, Green, Blue, Alpha)
# rgba(0, 0, 0, 0.2) = 00000033
# rgba(255, 255, 255, 1.0) = ffffffff

i3lock \
  --blur 10 \
  --clock \
  --indicator \
  --time-font="JetBrainsMono Nerd Font" \
  --time-size=100 \
  --time-color=ffffffff \
  --date-color=ffffffff \
  --time-pos="ix:iy-150" \
  --radius=60 \
  --ring-width=4 \
  --inside-color=00000033 \
  --ring-color=ffffffff \
  --insidever-color=00000033 \
  --ringver-color=ffffffff \
  --insidewrong-color=00000033 \
  --ringwrong-color=ff0000ff \
  --line-color=00000000 \
  --keyhl-color=ccccccff \
  --bshl-color=ff0000ff \
  --separator-color=00000000 \
  --verif-text="" \
  --wrong-text="" \
  --noinput-text=""
