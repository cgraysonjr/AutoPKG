#!/bin/bash

accountCheck=("itwsupport")

node=${2:-"/Local/Default"}

for u in $(dscl "$node" list /Users ); do
	echo $u
	#/usr/sbin/dseditgroup -o edit -d $u -t user admin
fi

done