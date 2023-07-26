#!/bin/bash
#
# This is for a very minimal install of Gnome on Debian.
#
ksd="kde-plasma-desktop"
apps="sddm
    cups
    plasma-pa
    plasma-nm
    plasma-discover
    fwupd
    network-manager
    plymouth
    plymouth-themes
    git
    rsync
    borgbackup"

if [ ! -x /usr/sbin/sddm ]
then
    read -p "Repo Update" -t 2
    echo -e "\n"
    apt update

    read -p "Installing $gs" -t 2
    echo -e "\n"
    apt install -y $ksd

    read -p "Installing $apps" -t 2
    echo -e "\n"
    apt install -y $apps

    read -p "Cleaning up" -t 2
    echo -e "\n"
    systemctl enable sddm cups
    sed -i 's/false/true/g' /etc/NetworkManager/NetworkManager.conf

else
    read -p "Everything's installed  " -t 2
fi
