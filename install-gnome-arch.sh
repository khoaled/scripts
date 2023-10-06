#!/bin/bash
#
# This is for a very minimal install of Gnome on Debian.
#
nope="--noconfirm"

gs="gnome-shell
    xorg-server
    xorg-xwayland
    apci
    acpid"

apps="gnome-tweaks
    gnome-control-center
    gdm
    cups
    cups-browsed
    gvfs-smb
    gvfs-nfs
    nfs-utils
    xdg-desktop-portal
    xdg-desktop-portal-gnome
    xdg-desktop-portal-gtk
    power-profiles-daemon
    plymouth
    gnome-tweaks
    gnome-software
    gnome-system-monitor
    gnome-disk-utility
    fwupd
    git
    rsync
    borg"

if [ ! -x /usr/bin/gdm ]
then

    read -p "Installing $gs" -t 2
    echo -e "\n"
    pacman -S $nope $gs

    read -p "Installing $apps" -t 2
    echo -e "\n"
    pacman -S $nope $apps

    read -p "Cleaning up" -t 2
    echo -e "\n"
    # enabling services
    systemctl enable gdm cups acpid avahi-daemon
    # editing /boot/loader/loader.conf & /etc/mkinitcpio.conf
    sed -i 's/3/0/g' /boot/loader/loader.conf
    sed -i 's/fsck/fsck plymouth/g' /etc/mkinitcpio.conf
    # editing mkinitcpio.conf
    read -p "Enter driver - i915, AMDGPU: " driver
    sed -i 's/MODULES=()/MODULES=($driver)/g' /etc/mkinitcpio.conf
    # enabling changes for the kernel.
    mkinitcpio -p linux
    

else
    read -p "Everything's installed  " -t 2
fi
