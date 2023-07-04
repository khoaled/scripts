#!/bin/bash
#
#
hpath="/home/micah"
rpath="/media/micah/micah/backups"

if [ /usr/bin/borg ]
then
  read -p "listing backups in the repo" -t 2
  borg list $rpath

  read -p "backing up $hpath" -t 2
  borg create --verbose --stats $rpath::backup-$(date +%F) $hpath
else
  read -p "borg isn't installed." -t 2
fi
