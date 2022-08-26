#!/bin/bash

OS_TYPE=$(uname)

#if [[ ${OS_TYPE} == "Linux" ]]
#then
#    if [[ ${UID} -eq 0 ]]
#then
#  echo "OS is Linux and user is root"
# fi
#fi


if [[ ${OS_TYPE} == "Linux" && ${UID} -eq 0 ]]
then
	echo "os is linux and user is root"
fi
