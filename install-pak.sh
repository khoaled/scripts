#!/bin/bash
#
# Micah's Flatpak install script
#
paks="org.mozilla.firefox
      org.chromium.Chromium
      com.brave.Browser
      com.spotify.Client
      com.bitwarden.desktop
      com.visualstudio.code
      com.mojang.Minecraft
      org.libreoffice.LibreOffice
      com.raggesilver.BlackBox
      org.gnome.eog
      org.gnome.Weather
      org.gnome.Calculator
      org.gnome.clocks"


if [ ! -x /usr/bin/flatpak ]
then
    read -p "Installing flatpak and the flatpak repo" -t 2
    sudo apt install -y flatpak gnome-software-plugin-flatpak
    sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

    read -p "Installing flatpaks" -t 2
    flatpak install -y $paks

else
    read -p "Installing flatpaks" -t 2
    flatpak install -y $paks
fi
