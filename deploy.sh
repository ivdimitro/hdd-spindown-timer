#!/bin/bash

FILE=/etc/systemd/system/spindown-manager.service

if test -f "$FILE"; then
    echo "file exists, reloading"
    cp $FILE /etc/systemd/system/
    systemctl daemon-reload
    systemctl restart spindown-manager.service
else
    cp $FILE /etc/systemd/system/
    systemctl enable --now spindown-manager.service
fi