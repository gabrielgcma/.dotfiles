#!/bin/bash
# Pre-flight check para atualizações críticas do Arch Linux

if ! mountpoint -q /boot; then
    echo ""
    echo "============================================================"
    echo " 🛑 ERRO CRÍTICO DE INFRAESTRUTURA: /boot NÃO ESTÁ MONTADO! "
    echo "============================================================"
    echo " A partição EFI provávelmente foi bloqueada pelo Windows."
    echo " O update do Kernel foi abortado para proteger o sistema."
    echo ""
    echo " AÇÃO NECESSÁRIA:"
    echo " 1. Rode: sudo mount /boot"
    echo " 2. Se falhar, você precisa desativar o Fast Startup no Windows."
    echo "============================================================"
    echo ""
    exit 1 # O código de saída 1 é o que vai dizer ao Pacman para abortar
fi

exit 0 # Tudo certo, pode seguir com a atualização
