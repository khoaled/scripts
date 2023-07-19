#!/bin/bash
#
#
if [ -x /usr/bin/apt ]
then
    apt update
    apt -y full-upgrade
    if [ -x /usr/bin/dnf]
    then
        dnf update
        dnf -y upgrade
    fi
else
    echo "nothing to do, exiting"
fi
