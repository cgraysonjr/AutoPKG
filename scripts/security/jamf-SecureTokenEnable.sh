#!/bin/bash

###########################################################################################
#JAMF Script. Requires interaction with a JAMF policy for functionality
###########################################################################################

###########################################################################################
#Pulls the administrator credentials from JAMF, assuming the account has a Secure Token 
#to access.
###########################################################################################
adminUser=$4
adminPassword=$5

###########################################################################################
#Function consoleUser: 
#returns the console\user name of the logged in user
###########################################################################################
consoleUser() {
	echo "show State:/Users/ConsoleUser" | scutil | awk '/Name :/ && ! /loginwindow/ { print $3 }'
}

displayfortext() { # $1: message $2: default text
	message=${1:-"Message"}
	defaultvalue=${2:-""}
	user=$(consoleUser)
    if [[ $user != "" ]]; then
        uid=$(id -u "$user")
	
	    launchctl asuser $uid /usr/bin/osascript <<-EndOfScript
			text returned of ¬
				(display dialog "$message" ¬
					with hidden answer default answer "$defaultvalue" ¬
					buttons {"OK"} ¬
					default button "OK")
			EndOfScript
	else
	    exit 1
	fi
}

##############################################################
#Get the logged user's console\user name and store in in a variable
##############################################################
userName=$(consoleUser)

##############################################################################
###This will prompt the user for their password and store it in a variable.###
##############################################################################
userPassword=$(displayfortext "Please enter password for user: $userName" "")

#####################################################################################################
###Store the output of the sysadminctl command into a variable to use it for error handling later.###
#####################################################################################################
output=$(sudo sysadminctl -adminUser "$adminUser" -adminPassword "$adminPassword" -secureTokenOn $userName -password $userPassword 2>&1)

######################################################################################################
###Error handling to see if the password entered is the same password used to log into the machine.###
######################################################################################################

##########################################################################################
###Searches for the output "Done". If this exist then the sysadminctl command will run.###
##########################################################################################
if [[ $output == *"Done"* ]]; then
    ############################################################################################################################
    ###Command used to provide the user a secureToken. The admin user must have a secure token or this command will not work.###
    ###You can always check the JAMF policy logs to see if the user is experiencing an issue.###################################
    ############################################################################################################################
    sysadminctl -adminUser "$adminUser" -adminPassword "$adminPassword" -secureTokenOn $userName -password $userPassword
    
    ##############################
    ###GUI dialog for the user.###
    ##############################
    title='MacOS FileVault Encryption'
	osascript -e "display dialog \"Your password has been successfully synced with FileVault!\" buttons {\"OK\"} default button \"OK\" with title \"$title\""
else
    ##############################
    ###GUI dialog for the user.###
    ##############################
    title='MacOS FileVault Encryption'
	osascript -e "display dialog \"The password entered did not match your password on this computer! Please quit and re-run the Self-Service policy to try again.\" buttons {\"Quit (Your password was not synced!)\"} default button \"Quit (Your password was not synced!)\" with title \"$title\""
fi