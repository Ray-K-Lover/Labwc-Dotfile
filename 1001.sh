#!/bin/bash

echo "====================================================="
echo "  Iniciando instalación del entorno Labwc + Noctalia "
echo "====================================================="

# 1. Instalar dependencias mediante pacman (sin confirmación manual)
echo "-> Instalando paquetes base..."
sudo pacman -S --needed labwc noctalia kitty yazi pipewire wireplumber pipewire-pulse pipewire-alsa wl-clipboard xdg-desktop-portal xdg-desktop-portal-wlr emptty --noconfirm

# 2. Crear directorios de configuración
echo "-> Creando estructura de directorios..."
mkdir -p ~/.config/labwc
sudo mkdir -p /etc/emptty

# 3. Copiar archivos de configuración desde la raíz del repositorio al sistema
echo "-> Copiando dotfiles..."
cp autostart ~/.config/labwc/
cp environment ~/.config/labwc/
cp rc.xml ~/.config/labwc/
sudo cp conf /etc/emptty/conf

# 4. Otorgar permisos de ejecución obligatorios
echo "-> Asignando permisos al autostart..."
chmod +x ~/.config/labwc/autostart

# 5. Habilitar el servicio de Emptty para el próximo reinicio
echo "-> Habilitando servicio Emptty..."
sudo systemctl enable emptty

echo "====================================================="
echo "  Instalación finalizada con éxito.                  "
echo "  Por favor, reinicia el sistema para aplicar.       "
echo "====================================================="
