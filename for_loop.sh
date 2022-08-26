#!/bin/bash

# case 1

for variableName in rohan vikas neel shubham
do
	echo "${variableName}"
done

###############################################################################################
# case 2

for variableName in "rohan jain" "vikas jain "  "neel jain "  shubham
do
        echo "${variableName}"
done

###########################################################################################
# case 3

read -p "please enter a number " number
for no in {1..10}
do
	echo "$((no*number))"
done

###################################################################################################
# case 4

for i in *
do 
	echo "${i}"
done

########################################################################################################
# case 5

for i in "$(ls -l *.sh)"
do 
	echo "${i}"
done
