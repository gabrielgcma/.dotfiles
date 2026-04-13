#!/usr/bin/env bash

# Encerra instâncias antigas do Polybar de forma limpa
polybar-msg cmd quit

# Aguarda os processos terminarem
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Lança a barra chamada 'main' em todos os monitores conectados
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload main -c ~/.config/polybar/config.ini &
  done
else
  polybar --reload main -c ~/.config/polybar/config.ini &
fi

echo "Polybar lançada com sucesso."
