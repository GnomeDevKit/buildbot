#!/bin/bash

cd /home/shared/GNOME/gnome-live/dev-kit/build-system
./refresh-gnome update
./refresh-gnome build
sleep 300
./bump-group.sh
