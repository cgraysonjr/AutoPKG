﻿#!/bin/bash

# Allows non-admin users to add printers.

#For printing

/usr/bin/security authorizationdb write system.preferences.printing allow
/usr/bin/security authorizationdb write system.print.operator allow
/usr/sbin/dseditgroup -o edit -n /Local/Default -a everyone -t group lpadmin
/usr/sbin/dseditgroup -o edit -n /Local/Default -a everyone -t group _lpadmin

exit 0;
