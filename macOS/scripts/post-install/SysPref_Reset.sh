#!/bin/bash

tmp_plist=/tmp/system.preferences.plist

/usr/bin/security authorizationdb read system.preferences > $tmp_plist

plutil -replace allow-root -bool true $tmp_plist                             
plutil -replace authenticated-user -bool true $tmp_plist
plutil -replace comment -string "Checked by the Admin framework when making changes to certain System Preferences." $tmp_plist 
plutil -replace group -string admin $tmp_plist
plutil -replace session-owner -bool false $tmp_plist
plutil -replace shared -bool true $tmp_plist
plutil -replace timeout -integer 2147483647 $tmp_plist
plutil -replace tries -integer 10000 $tmp_plist
plutil -replace version -integer 0 $tmp_plist

/usr/bin/security authorizationdb write system.preferences < $tmp_plist