#!/bin/bash
#
#
sh="/home"
sr="/"
snap="/.snapshots"

if [ -x /usr/bin/btrfs ]
then
    read -p "Listing snapshots" -t 2
    echo -e "\n"
    btrfs subvolume list /
    
    read -p "Creating daily snapshot" -t 2
    echo -e "\n"
    btrfs subvolume snapshot $sr $snap/system-root-$(date +%F)
    btrfs subvolume snapshot $sh $snap/system-home-$(date +%F) 

else
    echo "Can't find btrfs"
fi