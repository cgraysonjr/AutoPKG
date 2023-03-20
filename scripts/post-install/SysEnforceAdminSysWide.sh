#!/bin/bash
security authorizationdb read system.preferences > /tmp/system.preferences.plist
YES (0)
$ sudo defaults write /tmp/system.preferences.plist shared -bool false

$ sudo security authorizationdb write system.preferences <
/tmp/system.preferences.plist
YES (0)