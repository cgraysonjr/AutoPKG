#!/bin/sh

#############################################
# find the logged in user 					#
#############################################

currentUser=$(who | awk '/console/{print $1}')
echo $currentUser

# Kill Firefox if running
killall "firefox"

# Remove Firefox User Profile
rm -r /Users/"$currentUser"/Library/Application\ Support/Firefox/
