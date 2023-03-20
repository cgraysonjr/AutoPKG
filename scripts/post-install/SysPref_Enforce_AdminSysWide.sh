#!/bin/bash
# This must be set to if you are going to allow non-admin access to any of the preference panes.
/usr/bin/security authorizationdb read system.preferences > /tmp/system.preferences.plist
/usr/bin/defaults write /tmp/system.preferences.plist shared -bool false
/usr/bin/security authorizationdb write system.preferences < /tmp/system.preferences.plist