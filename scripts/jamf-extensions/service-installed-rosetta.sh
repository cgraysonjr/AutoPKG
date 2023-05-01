#!/bin/bash

# Check if the devices is a M-series processor
if [[ !($(uname -m) == 'arm64') ]]; then
	# If device isn't M series, set results to "Not Applicable"
	result="Not Applicable"
elif [[/usr/bin/pgrep oahd >/dev/null 2>&1]]; then
	result="Installed"
else
	result="Not Installed"
fi
echo "<result>$result</result>"