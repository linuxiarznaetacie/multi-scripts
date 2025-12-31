#!/bin/bash    

# Copyright (c) 2025 Jakub Orłowski
# Licensed under the MIT License. See LICENSE for details.

while true; do
    clear
    echo "+------------------------------------------------------------+"
    echo "        MULTI-SKRYPT SERVER | WYBIERZ JEDNĄ OPCJE"
    echo "+------------------------------------------------------------+"
    echo "1. Zainstaluj Cloudflared"
    echo "2. Zainstaluj NoVNC + Xfce4 + Firefox-ESR (tymczasowy skrypt)"
    echo "3. Uruchom Instalator Pterodactyl + Wings"
    echo "4. Zainstaluj zaleznosci"
    echo "5. Zainstaluj Docker'a"
    echo "6. Zainstaluj Windows 10 (Otworz port 8006)"
    echo "7. Zainstaluj QEMU i zaleznosci do menedzera VM"
    echo "8. Uruchom menedzer VM QEMU"
    echo "0. Wyłącz skrypt"
    echo "+------------------------------------------------------------+"
    read -p "Wybierz opcję [0-8]: " choice

    case $choice in
        1)
            echo "--- Instalowanie Cloudflared ---"
            sudo mkdir -p --mode=0755 /usr/share/keyrings && curl -fsSL https://pkg.cloudflare.com/cloudflare-public-v2.gpg | sudo tee /usr/share/keyrings/cloudflare-public-v2.gpg >/dev/null && echo 'deb [signed-by=/usr/share/keyrings/cloudflare-public-v2.gpg] https://pkg.cloudflare.com/cloudflared any main' | sudo tee /etc/apt/sources.list.d/cloudflared.list && sudo apt-get update && sudo apt-get install cloudflared && clear && echo "Pomyslnie zainstalowano program cloudflare tunnel"
            ;;
        2)
            echo "--- Instalowanie NoVNC + Xfce4 + Firefox-ESR ---"
            git clone https://github.com/vtstv/novnc-install.git && cd novnc-install && chmod +x novnc-install.sh && sudo ./novnc-install.sh && sudo apt install firefox -y && echo "Pomyslnie zainstalowano NoVNC!"
            ;;
        3)
            echo "--- Uruchomiono instalator Pterodactyl + Wings ---"
            sudo bash <(curl -sSf https://raw.githubusercontent.com/linuxiarznaetacie/ptero-installer/refs/heads/main/menu.sh) && echo "Pomyslnie zainstalowano Pterodactyl!"
            ;;
        4)
            echo "--- Instalowanie zaleznosci ---"
            sudo apt install wget git curl -y && echo "Pomyslnie zainstalowano zaleznosci!"
            ;;
        5)
            echo "--- Instalowanie Docker'a ---"
            bash <(curl -sSf https://raw.githubusercontent.com/linuxiarznaetacie/docker-installer/refs/heads/main/install-docker.sh && echo "Pomyslnie zainstalowano docker'a!"
            ;;
        6)
            echo "--- Zainstaluj Windows 10 (Otworz port 8006) ---"
            bash <(curl -sSf https://raw.githubusercontent.com/linuxiarznaetacie/install-windows/refs/heads/main/install-windows.sh) && echo "Zrobione!"
            ;;
        7)
            echo "--- Instalowanie QEMU i zaleznosci do menedzera VM ---"
            sudo apt install qemu-system cloud-image-utils wget curl git xrdp tigervnc-standalone-server tigervnc-xorg-extension -y && echo "Zainstalowano QEMU!"
            ;;
        8)
            echo "--- Uruchamianie menedzera VM ---"
            bash <(curl -sSf https://raw.githubusercontent.com/linuxiarznaetacie/firebase-vps-menu/refs/heads/main/vps.sh)
            ;;
        0)
            echo "Zamykanie skryptu..."
            exit 0
            ;;
        *)
            echo "Błędny wybór, spróbuj ponownie."
            sleep 1
            ;;
    esac
done
