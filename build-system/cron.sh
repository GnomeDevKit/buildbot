#!/bin/bash

cd /home/shared/GNOME/gnome-live/build-system
# git pull
./refresh-gnome update
./refresh-gnome build
sleep 300
./bump-group.sh
