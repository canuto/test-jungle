#!/bin/bash

# Functions
usage()
{
    echo "Usage: setup_device.sh [[-l LOGIN@MACHINE -p NEW_PASSWORD | [-h]]"
}

if [ -z $1 ]; then
  usage
  exit 1
fi

# Parse script arguments
POSITIONAL_ARGS=
PASSWORD=
LOGIN=

echo $#

while [[ $# -gt 0 ]]; do
  case $1 in
    -p|--password)
      PASSWORD="$2"
      shift # past argument
      shift # past value
      ;;
    -l|--login)
      LOGIN="$2"
      shift # past argument
      shift # past value
      ;;
    -*|--*)
      echo "Unknown option $1"
      exit 1
      ;;
    *)
      POSITIONAL_ARGS+=("$1") # save positional arg
      shift # past argument
      ;;
  esac
done

set -- "${POSITIONAL_ARGS[@]}" # restore positional parameters

echo "Password: $PASSWORD"
echo "Login: $LOGIN"

