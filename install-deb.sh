#!/bin/bash
#
# This is for a very minimal install of Gnome on Debian.
#
gcc=gnome-control-center
apps="gnome-tweaks
    gdm3
    cups
    nautilus
    plymouth
    plymouth-themes
    gnome-shell-extensions
    gnome-shell-extensions-extra
    gnome-tweaks"

if [ ! /usr/sbin/gdm3 ]
then
    read -p "Repo Update" -t 2
    apt update

    read -p "Installing $gcc" -t 2
    apt install -y --no-install-recommends $gcc

    read -p "Installing $apps"
    apt install -y $apps

else
    read -p "Everything's installed  " -t 2
fi
