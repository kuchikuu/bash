#!/bin/bash

# Written by KuchiKuu (Sebastian Skibiński)
# No Licensing, No copyrights, No fucks given.

# DESCRIPTION:
# Star script to open a desired (one) file with lite
# Save this anywhere you like, and make a link to your PATH
# In my case: sudo link start-lite.sh /usr/local/bin/lite

# Write the full path to your compilation folder
PATHtoLITE="/home/user/sources/lite-1.08" # <- without / at the end

# Get the current directory PATH
currentDIR=`pwd`

# writing data for local project_dir = EXEDIR hijack
# DO THE STEPS DESCRIBED AT THE VERY BOTTOM OR COMMENT THESE 2 LINES BELOW!!! (#)

echo "local project_dir = \"$currentDIR\"" > $PATHtoLITE/data/core/EXEDIR
cat $PATHtoLITE/data/core/EXEDIR $PATHtoLITE/data/core/init.lua.fake > $PATHtoLITE/data/core/init.lua



# Uncomment line below, if you want to see what the script is trying to open
#echo "File that you're trying to open: $currentDIR/$1"

# Check if the file exists. If not, create it.
[[ ! -a "$currentDIR/$1" ]] && touch "$currentDIR/$1"

# Check if the file exists again. If exists, run lite with the file path as argument
[[ -a "$currentDIR/$1" ]] && $PATHtoLITE/lite "$currentDIR/$1"

# If no data was saved to the file, remove it.
[[ ! -s "$currentDIR/$1" ]] && rm "$currentDIR/$1"




# I assume, if the second check fails, the system will go bananas.
#
# $ mkdir test
# $ chmod -w test
# $ cd test
# $ lite something
# touch: can't touch '/home/user/sources/lite-1.08/test/somethingg': Permission denied
# rm: can't remove '/home/user/sources/lite-1.08/test/somethingg': No such file or directory



# The local project_dir = EXEDIR hijack
#
# $ cd MAIN_LITE_DIRECTORY
# $ cd data/core
# $ cp init.lua init.lua.original
# $ edit init.lua
# Go to line 85 and cut the whole line that says "local project_dir = EXEDIR"
# Save the file as init.lua.fake

# This script will combine the two files (EXEDIT + init.lua.fake) into 1, so that
# the config file uses current PWD as the project directory.

# Current bugs: Giving a full path to a file that you want to open
# breaks this pretty hard.

# Example: lite /etc/hostname

# This is due of how I "implemented" $currentDIR/$1
# Well....
