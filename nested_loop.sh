#!/bin/bash

initNumber=1
while [[ ${initNumber} -lt 3 ]]
do
	for i in item1 item2 item3
	do
		echo "${initNumber} - ${i}"
		if [[ $i == item2 ]]
		then
			break;
		fi
	done
	((initNumber++))
done
