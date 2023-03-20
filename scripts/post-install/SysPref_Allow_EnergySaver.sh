#!/bin/bash
# enable non-admin access to the energy saver prefs
/usr/bin/security authorizationdb read  system.preferences.energysaver > /tmp/system.preferences.energysaver.plist
/usr/bin/defaults write /tmp/system.preferences.energysaver.plist group everyone
/usr/bin/security authorizationdb write system.preferences.energysaver < /tmp/system.preferences.energysaver.plist