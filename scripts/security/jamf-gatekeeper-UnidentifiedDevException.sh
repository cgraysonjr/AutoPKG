#!/bin/bash
# Removes the given application from the apple quarantine list <com.apple.quarantine>.
# Prevents the computer from blocking the given app from running.
xattr -d com.apple.quarantine "/Applications/$4"

# Ensures success code of script run.
# If attribute doesn't exist, above command railes to remove it.
exitcode=0