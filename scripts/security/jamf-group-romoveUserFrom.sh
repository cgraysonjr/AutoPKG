#!/bin/bash

accountCheck=("root" $4 $5 $6)
echo $accountCheck
adminsLocal=$(dscacheutil -q group -a name admin | awk '/users: / {$1=""; print $0}')
echo $adminsLocal