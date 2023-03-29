#!/bin/bash

accountCheck=("root" $4 $5 $6)
adminsLocal=$(dscacheutil -q group -a name admin | awk '/users: / {$1=""; print $0}')
