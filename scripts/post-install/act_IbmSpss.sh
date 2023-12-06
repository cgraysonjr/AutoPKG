#!/bin/bash
# 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# Script			: activate_spss
# Usage				: activate_spss
# Author Original	: Carmichael Grayson
# Date				: 17-08-07
# Last Modified By	: Carmichael Grayson
# Last Edited		: 23-12-06
# Description		: License Activator for SPSS Statistics 
# Operating System	: Mac OSX
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# Default directory of IBM SPSS
__dir_spss=/Applications/IBM\ SPSS\ Statistics
__dir_spss_la=/SPSSStatistics.app/Contents/bin/

# License for currently active SPSS
__license_spss_29=""
__license_spss_28=""

# Check variables for alternate license 
if [ ! -z "$4" ]; then
	__license_spss_29=$4
fi
if [ ! -z "$5" ]; then
	__license_spss_28=$5
fi

function _apply_license()
{
	__working_dir=$1
	__license_str=$2
	if [ -d "$__working_dir" ]; then
		pushd "$__working_dir"
		./licenseactivator $__license_str
		popd
	fi	
}

_apply_license "$__dir_spss/$__dir_spss_la" "$__license_spss_29"
_apply_license "$__dir_spss/$__dir_spss_la" "$__license_spss_28"