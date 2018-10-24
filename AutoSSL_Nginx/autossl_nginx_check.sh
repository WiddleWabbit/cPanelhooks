#!/bin/bash

# Script section of cPanel hook designed to run the nginx autossl symlink checker script for each account
# on installation of a new auto ssl certificate.

# For each user in the system

for user in /var/cpanel/users/*
do
    user=$(sed 's;/var/cpanel/users/;;g' <<< "${user}")
    if [[ ! ${user} == "system" ]]
    then

        # Run the script with the user

        script="/root/scripts/cron/nginx/nginx_sslupdate.py -u ${user}"
        ${script}        


    fi
done

