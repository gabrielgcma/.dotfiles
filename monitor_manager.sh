#!/usr/bin/env bash

# monitor_setup.sh - Automação de Display para i3wm
# Criado para garantir portabilidade entre Home/Work setups.

set -e

GREEN='\033[0;32m'
NC='\033[0m'

function usage() {
	echo "Uso: $0 [save|apply|setup]"
	echo "  save <nome>  Salva o arranjo atual de telas"
	echo "  apply        Detecta hardware e aplica perfil salvo"
	echo "  setup        Instala dependências e ativa o serviço udev"
	exit 1
}

function setup_system() {
	echo -e "${GREEN}[*] Instalando dependências...${NC}"
	sudo pacman -S --needed autorandr xorg-xrandr arandr

	echo -e "${GREEN}[*] Ativando serviço de hotplug...${NC}"
	sudo systemctl enable autorandr.service
	sudo systemctl start autorandr.service
	echo "Pronto! Use o arandr para configurar suas telas e depois salve o perfil."
}

case "$1" in
save)
	if [ -z "$2" ]; then usage; fi
	autorandr --save "$2"
	echo -e "${GREEN}[+] Perfil '$2' salvo com sucesso.${NC}"
	;;
apply)
	echo -e "${GREEN}[*] Detectando monitores...${NC}"
	autorandr --change --force
	;;
setup)
	setup_system
	;;
*)
	usage
	;;
esac
