#!/bin/bash
#
# Micah's Flatpak install script
#
gpaks="org.mozilla.firefox
      org.chromium.Chromium
      com.brave.Browser
      com.spotify.Client
      com.bitwarden.desktop
      com.visualstudio.code
      com.mojang.Minecraft
      org.libreoffice.LibreOffice
      com.raggesilver.BlackBox
      com.mattjakeman.ExtensionManager
      org.gnome.eog
      org.gnome.Weather
      org.gnome.Calculator
      org.gnome.clocks"

kpaks="org.mozilla.firefox
      org.chromium.Chromium
      com.brave.Browser
      com.spotify.Client
      com.bitwarden.desktop
      com.visualstudio.code
      com.mojang.Minecraft
      org.libreoffice.LibreOffice
      com.raggesilver.BlackBox"
 
if [ ! -x /usr/bin/flatpak ] && [ -x /usr/sbin/gdm3 ]
then
    read -p "Installing flatpak and the flatpak repo" -t 2
    echo -e "\n"
    sudo apt install -y flatpak gnome-software-plugin-flatpak
    sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

    read -p "Installing flatpaks" -t 2
    echo -e "\n"
    sudo flatpak install -y $gpaks
elif [ ! -x /usr/bin/flatpak ] && [ -x /usr/sbin/sddm ] 
then
    read -p "Installing flatpak and the flatpak repo" -t 2
    echo -e "\n"
    sudo apt install -y flatpak plasma-discover-backend-flatpak
    sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

    read -p "Installing flatpaks" -t 2
    echo -e "\n"
    sudo flatpak install -y $kpaks
    
else
    read -p "Done" -t 2
    echo -e "\n"
fi
