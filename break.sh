#!/bin/bash

initNumber=1
while [[ ${initNumber} -lt 10 ]]
do
	echo "${initNumber}"
	if [[ ${initNumber} -eq 5 ]]
	then
		echo "Number is equal to 5 and loop is going to break"
		break;
	fi
	((initNumber++))
done
