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
    gnome-shell-extensions
    gnome-shell-extensions-extra
    gnome-tweaks
    gnome-software
    fwupd
    git
    rsync"

if [ /usr/sbin/gdm3 ]
then
    read -p "Repo Update" -t 2
    apt update

    read -p "Installing $gs" -t 2
    apt install -y --no-install-recommends $gs

    read -p "Installing $apps" -t 2
    apt install -y $apps

    read -p "Cleaning up" -t 2
    systemctl enable gdm3 cups
    sed -i 's/false/true/g' /etc/NetworkManager/NetworkManager.conf

else
    read -p "Everything's installed  " -t 2
fi
