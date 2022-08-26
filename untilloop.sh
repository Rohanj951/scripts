#!/bin/bash
read -p "please enter number " number
initNumber=1
until [[ ${initNumber} -eq 10 ]]
do
	echo "$((initNumber*number))"
	((initNumber++))
done
