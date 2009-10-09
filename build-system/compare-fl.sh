#!/bin/bash

if [ $# -ne 1 ]
then
    echo "Usage: $0 <package-name>"
    exit
fi

gnome_dir=$HOME/conary/gnome/trunk/
fl_dir=$HOME/conary/foresight/
pkg=$1

cd $gnome_dir/
cvc co $pkg

cd $fl_dir/
cvc co $pkg

diff -u $fl_dir/$pkg/$pkg.recipe $gnome_dir/$pkg/$pkg.recipe
