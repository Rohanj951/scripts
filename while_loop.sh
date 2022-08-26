#!/bin/bash

#while [[ ${answer} != "yes" ]]
#do
#	echo "you enter ${answer} "
#done

#while [[ ${answer} != "yes" ]]
#do
#	read -p " please enter yes "  answer
#done

#initNumber=1
#while [[ ${initNumber} -le 10 ]]
#do
#	echo ${initNumber}
#           ((initNumber++))
#done

read -p "Please enter a number " number
initNumber=1
while [[ ${initNumber} -le 10 ]]
do 
	echo " $((initNumber*number)) "
	((initNumber++))
done

