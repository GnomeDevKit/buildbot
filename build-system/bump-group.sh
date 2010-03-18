#!/bin/bash

workingDir=$HOME/conary/gnome/trunk
currentDir=`pwd`
context="gnome:trunk"

cd $workingDir
echo "Bumping group version"
cvc co --context $context group-world

cd group-world
echo "" >> group-world.recipe
cvc commit --context $context --message "Group bump"
echo "Group version bumped"

echo "Cooking group-world"
./cook.sh
grep -i warning log
grep -i error log

cd $currentDir
