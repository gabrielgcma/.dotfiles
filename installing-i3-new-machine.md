# Gerenciamento Dinâmico de Monitores (i3wm + autorandr)

Diferente do Wayland/Hyprland, o X11 não reage nativamente ao hotplug de monitores. Este setup utiliza o `autorandr` para automatizar a transição entre perfis (Home, Trabalho, Mobile).

## Requisitos
- `autorandr`: Gerenciador de perfis (automaticamente detecta perfis salvos).
- `arandr`: Interface gráfica para organizar as telas inicialmente (GUI pro xrandr).
- `xrandr`: Ferramenta base do Xorg.

## Fluxo de Trabalho
1. **Conecte** os novos monitores.
2. **Organize** a disposição usando a ferramenta `arandr`.
3. **Aplique** as mudanças no `arandr`.
4. **Salve** o perfil com `./monitor_manager.sh save <nome>`.

## Perfis Sugeridos
- `mobile`: Apenas a tela do notebook Dell Inspiron.
- `home`: Notebook + Monitor HDMI de casa.
- `work`: Configuração específica do escritório/empresa.

## Automação
O i3wm está configurado para disparar `autorandr --change` via `$mod+p` ou automaticamente via regras de udev do sistema.
