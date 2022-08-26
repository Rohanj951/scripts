#!/bin/bash

number=5

if test $number -eq 5
then 
	echo "number equal to 5"
fi

if [ $number -lt 10 ]
then
	echo "number is then 10"
fi

if [ $number -gt 4 ]
then 
	echo "number is greater than 4"
fi

number=15

if test $number -eq 5
then
        echo "number equal to 5"
fi

if [ $number -lt 10 ]
then
        echo "number is then 10"
fi

if [ $number -gt 4 ]
then
        echo "number is greater than 4"
fi

