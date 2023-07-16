#!/bin/bash
#
# This is for a very minimal install of Gnome on Debian.
#
gs="gnome-shell"
apps="gnome-tweaks
    gnome-control-center
    gdm3
    cups
    nautilus
    plymouth
    plymouth-themes
    gnome-tweaks
    gnome-software
    gnome-system-monitor
    gnome-disk-utility
    gnome-software
    gnome-software-plugin-flatpak
    flatpak
    fwupd
    git
    rsync"

if [ ! -x /usr/sbin/gdm3 ]
then
    read -p "Repo Update" -t 2
    echo -e "\n"
    apt update

    read -p "Installing $gs" -t 2
    echo -e "\n"
    apt install -y --no-install-recommends $gs

    read -p "Installing $apps" -t 2
    echo -e "\n"
    apt install -y $apps

    read -p "Cleaning up" -t 2
    echo -e "\n"
    systemctl enable gdm3 cups
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    sed -i 's/false/true/g' /etc/NetworkManager/NetworkManager.conf

else
    read -p "Everything's installed  " -t 2
fi
