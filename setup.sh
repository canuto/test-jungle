#!/bin/bash

# Functions
usage()
{
    echo "Usage: setup_device.sh [[-u user@machine -p NEW_PASSWORD | [-h]]"
}

if [ -z $1 ]; then
  usage
  exit 1
fi

# Parse script arguments
new_password=
login=

while [ "$1" != "" ]; do
    echo "param $1"
    case $1 in
        -p )                    shift
                                new_password=$1
                                ;;
        -u )                    shift
                                login=$1
                                ;;
        * )                     usage
                                exit 1
    esac
    shift
done

echo "New password: $new_password"
echo "Login: $login"
