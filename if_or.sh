#!/bin/bash

OS_TYPE=$(uname)

if [[ ${OS_TYPE} == "Linuxx" || ${UID} -eq 0 ]]
then
	echo "os is linux and user is root"
fi
