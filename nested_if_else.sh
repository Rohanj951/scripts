#!/bin/bash

echo "case 1"
number=15

if [[ ${number} -eq 10 ]]
then 
	echo "number is equal to 10"
else
	if [[ ${number} -gt 10 ]]
	then 
		echo "number is greater than 10 "
	else
		echo "number is smaller than 10 "
	fi
fi
echo

echo "case 2"
number=51

if [[ ${number} -gt 10 ]]
then
	if [[ ${number} -gt 50 ]]
	then 
		echo "number is greater than 50"
	else
		echo "number is smaller than 50"
	fi
else
	echo "number is smaller than 10"
fi
echo

echo "case 3"
number=55

if [[ ${number} -gt 10 ]]
then
        if [[ ${number} -gt 50 ]]
        then
		if [[ ${number} -gt 100 ]]
		then
			echo "number is greater than 100"
		else
			echo "number is between 51 to 100"
		fi
        else
                echo "number is smaller than 50"
        fi
else
        echo "number is smaller than 10"
fi
		
