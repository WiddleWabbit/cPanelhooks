#!/bin/bash

files[0]='gcc'
files[1]='ld'

numfiles=${#files[@]}

function checkpermissions() {

    if [[ ! $stat =~ "755" ]]; then

        chmod 755 /usr/bin/$check
        echo "Changed Permissions "$check

    else

        return 0

    fi

}

for (( i=0; i<$numfiles; i++ ))
do

    check=${files[$i]}
    stat=$(stat -c "%A %a %n" /usr/bin/$check)
    checkpermissions $stat

done
