#!/bin/bash
#
# Copyright (C) 2008 Ken VanDine <ken@vandine.org>
#
# Licensed under the GNU General Public License Version 2
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.


create_conaryrc() {
echo "lookaside    $HOME/source/cache
buildPath    $HOME/source/builds
name         $fullname
contact      $email
cleanAfterCook  False

[gnome:trunk]
buildLabel  gnome.rpath.org@gnome:trunk
" >  $HOME/.conaryrc
}

make_dirs() {

    mkdir -p $HOME/source/cache
    mkdir -p $HOME/source/builds
    mkdir -p $HOME/source/gnome
}

echo "setup_build_env.sh is a script to help automate setting up a build environment for the gnome developer kit."
echo "For more information on how to get started and what this script does, please visit this webpage: http://live.gnome.org/GnomeDeveloperKit/BuildingPackages"

if  [  -f $HOME/.conaryrc ]
then
        echo ".conaryrc already exists, exiting"
        exit
else
        read -p "Full Name: " fullname
        read -p "E-mail Address: " email
        create_conaryrc
        make_dirs
        cd $HOME/source/gnome
        cvc context gnome:trunk
        echo "Created build environment, you will find your working directory at $HOME/source/gnome"
fi

