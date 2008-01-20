#!/bin/bash

cd $HOME/src/gnome-live/dev-kit/build-system
./refresh-gnome update
./refresh-gnome build
./refresh-gnome bump
