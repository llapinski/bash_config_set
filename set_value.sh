#!/bin/bash

if [ $# != 3 ]; then
  echo "You should pass three arguments to this script.\n
	1. Configuration file\n
	2. Key to add/change\n
	3. Value to set\n\t
ie. change_value /tmp/test.config sourceip 192.168.10.1 "
fi

FILE=$1
KEY=$2
VALUE=$3


if [ ! -e "${FILE}" ] ; then
    touch $FILE
    echo "$2=\"$3\"" | sudo tee --append $FILE
fi


function change_config(){
#$1 Key, \s - spaces and tabs, =  - is changed to $KEY=$VALUE
    sed -i "s/^\($1\)\s*=\s*.*\$/\1=$2/" $FILE
}


echo "Changing key $2 to value $3"
change_config $2 $3
