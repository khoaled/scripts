#!/bin/bash
#
#
hpath="/home/micah"
rpath="/media/micah/micah/backups"

echo "listing backups in the repo"
borg list $rpath

echo "backing up $hpath"
borg create --verbose --stats $rpath::backup-$(date +%F) $hpath

