#!/bin/bash
if [[ !($(uname -m) == 'arm64') ]]; then
  result="Not Applicable"
else if [[/usr/bin/pgrep oahd >/dev/null 2>&1]]; then
	result= "Installed"
else
	result="Not Installed"
fi
echo "<result>$result</result>"
