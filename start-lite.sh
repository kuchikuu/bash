#!/bin/bash

# Written by KuchiKuu (Sebastian Skibiński)
# No Licensing, No copyrights, No fucks given.

# DESCRIPTION:
# Star script to open a desired (one) file with lite
# Save this anywhere you like, and make a link to your PATH
# In my case: sudo link start-lite.sh /usr/local/bin/lite


currentDIR=`pwd`

# Uncomment line below, if you want to see what the script is trying to open
#echo "File that you're trying to open: $currentDIR/$1"

# Check if the file exists. If not, create it.
[[ ! -a "$currentDIR/$1" ]] && touch "$currentDIR/$1"

# Check if the file exists again. If exists, run lite with the file path as argument
[[ -a "$currentDIR/$1" ]] && /home/user/sources/lite-1.08/lite "$currentDIR/$1"

# If no data was saved to the file, remove it.
[[ ! -s "$currentDIR/$1" ]] && rm "$currentDIR/$1"




# I assume, if the second check fails, the system will go bananas.
#
# mkdir test
# chmod -w test
# cd test
# lite something
# touch: can't touch '/home/user/sources/lite-1.08/test/somethingg': Permission denied
# rm: can't remove '/home/user/sources/lite-1.08/test/somethingg': No such file or directory

