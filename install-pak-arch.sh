#!/bin/bash
#
# Micah's Flatpak install script
#
nope="--noconfirm"

paks="org.mozilla.firefox
      com.google.Chrome
      com.spotify.Client
      com.bitwarden.desktop
      com.visualstudio.code
      com.mojang.Minecraft
      org.libreoffice.LibreOffice"



if [ ! -x /usr/bin/flatpak ]
then
    read -p "Installing flatpak and the flatpak repo" -t 2
    echo -e "\n"
    sudo pacman -S $nope flatpak
    sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

    read -p "Installing flatpaks" -t 2
    echo -e "\n"
    flatpak install -y $paks

else
    read -p "Installing flatpaks" -t 2
    echo -e "\n"
    flatpak install -y $paks
fi
