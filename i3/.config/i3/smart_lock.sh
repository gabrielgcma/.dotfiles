#!/usr/bin/env bash

# Checa se algum processo está usando os dispositivos de vídeo
if fuser /dev/video* >/dev/null 2>&1; then
	exit 0 # Aborta o bloqueio
fi

# 2. Filtro de Chamada de Voz (Microfone)
# Usa o pactl (que vi na sua config) para ver se algo está captando áudio agora
MIC_IN_USE=$(pactl list source-outputs | grep -c "State: RUNNING")
if [ "$MIC_IN_USE" -gt 0 ]; then
	exit 0 # Aborta o bloqueio
fi

# 3. Filtro de Aplicativos VIP
# Se o processo existir na memória, a tela NÃO apaga.
# Pode adicionar jogos ou outros apps aqui depois.
VIP_APPS=("stremio" "zoom" "teams")
for app in "${VIP_APPS[@]}"; do
	if pgrep -x "$app" >/dev/null 2>&1; then
		exit 0 # Aborta o bloqueio
	fi
done

# Se passou por todos os filtros, você realmente não está no PC. Pode bloquear.
xset dpms force off && ~/.config/i3/lock.sh
