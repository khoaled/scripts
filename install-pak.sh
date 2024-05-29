#!/bin/bash
#
# Micah's Flatpak install script
#
gpaks="org.mozilla.firefox
      com.google.Chrome
      com.spotify.Client
      org.gnome.World.PikaBackup
      com.bitwarden.desktop
      com.visualstudio.code
      com.mojang.Minecraft
      org.libreoffice.LibreOffice
      com.mattjakeman.ExtensionManager
      org.gnome.Calculator"

kpaks="org.mozilla.firefox
      com.google.Chrome
      com.spotify.Client
      com.bitwarden.desktop
      com.visualstudio.code
      org.libreoffice.LibreOffice"
 
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
