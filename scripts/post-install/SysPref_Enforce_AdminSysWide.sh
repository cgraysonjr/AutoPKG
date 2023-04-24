#!/bin/bash

#Users will need to enter their password to unlock some additional preference panes that are unlocked by default like Network, Startup and Printers & Scanners.
# CIS Benchmark
#2.5.9 Ensure an Administrator Password Is Required to Access System-Wide Preferences (Automated)

/usr/bin/security authorizationdb read system.preferences > /tmp/system.preferences.plist
/usr/bin/defaults write /tmp/system.preferences.plist shared -bool false
/usr/bin/security authorizationdb write system.preferences < /tmp/system.preferences.plist