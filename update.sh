#!/bin/bash
#
#
if [ -x /usr/bin/apt ]
then
    sudo apt update
    sudo apt -y full-upgrade
    if [ -x /usr/bin/dnf ]
    then
        sudo dnf update
        sudo dnf -y upgrade
    else
        echo "no dnf here"
    fi
else
    echo "nothing to do, exiting"
fi
if [ -x /usr/bin/flatpak ]
then
    sudo flatpak -y update
else
    echo "no flatpak"
fi