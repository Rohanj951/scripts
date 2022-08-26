#!/bin/bash

name="rohan"
othername="rohan jain"

echo "case 1"
if [[ -n ${name} ]]
then
        echo "lenght of string is non-zero"
else
	echo "lenght of string is 0"
fi

echo

echo "case 2"

if [[ -z ${name} ]]
then
        echo "lenght of string is zero"
else
	echo "lenght of string is non-zero"
fi

echo 


echo "case 3"

if [[ ${name} == ${othername} ]]
then 
	echo "both strings are equal"
else
	echo "both strings are not equal"
fi
