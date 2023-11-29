#!/bin/bash
#
# This is for a very minimal install of Gnome on ArchLinux.
#
nope="--noconfirm"

kde="acpi
    acpid
    ark
    borg
    cups
    discover
    dolphin
    firewalld
    flatpak
    fwupd
    fwupd-efi
    kde-gtk-config
    kdeplasma-addons
    kinfocenter
    konsole
    kscreen
    lightdm
    lightdm-settings
    lightdm-slick-greeter
    nano
    packagekit-qt5
    plasma-desktop
    breeze-gtk
    plasma-disks
    plasma-firewall
    plasma-nm
    plasma-pa
    plasma-systemmonitor
    plasma-wayland-protocols
    plasma-wayland-session
    plymouth
    reflector
    system-config-printer
    thermald
    xdg-desktop-portal-kde
    xdg-user-dirs"

if [ ! -x /usr/bin/lightdm ]
then

    read -p "Installing $kde" -t 2
    echo -e "\n"
    pacman -S $nope $kde

    read -p "Cleaning up" -t 2
    echo -e "\n"
    # enabling services
    systemctl enable lightdm cups acpid avahi-daemon thermald firewalld
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
