#!/bin/bash

if [[ "$*" -eq 0 ]]
then 
	echo "please run again and pass command line arg"
else
	echo "============loop1==============="
	for i in "$*"
	do
	  echo "${i}"
        done
fi



echo "============loop2==============="
for i in "$@"
do
	echo "${i}"
done
