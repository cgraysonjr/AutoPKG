#!/bin/bash

# Changes Pemissions to allow anyone to add and delete printers.

#Modifies authorizationdb to allow the Everyone group access to the System Preferences Printer panel
/usr/bin/security authorizationdb write system.preferences.printing allow
#Modifies authorizationdb to allow the Everyone group access to the System Preferences Print Operator panel
/usr/bin/security authorizationdb write system.print.operator allow
# Adds the Everyone group to the lpadmin group
/usr/sbin/dseditgroup -o edit -n /Local/Default -a everyone -t group lpadmin
# Adds the Everyone group to the lpadmin group
/usr/sbin/dseditgroup -o edit -n /Local/Default -a everyone -t group _lpadmin
