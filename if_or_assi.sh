#!/bin/bash

read -p "do you want to continue (Y/y/Yes) ? " uservalue 
if [[ ${uservalue,,} == "y" || ${uservalue,,} == "yes" ]]
then
	echo " you want it "
else
	echo "you don't wnt it"
fi
