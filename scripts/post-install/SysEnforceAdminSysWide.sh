#!/bin/bash
/usr/bin/security authorizationdb read system.preferences > /tmp/system.preferences.plist

YES (0)

/usr/bin/defaults write /tmp/system.preferences.plist shared -bool false

/usr/bin/security authorizationdb write system.preferences < /tmp/system.preferences.plist

YES (0)