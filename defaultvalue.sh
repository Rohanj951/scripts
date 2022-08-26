#!/bin/bash

read -p "please enter your name " name

name=${name:-world}       # if user do not give input then set default value of name is World
echo "your name is ${name^}"

yourname=${unsetvariable-Rohan}

echo "my name is ${yourname} "



# '-' set value value var is undefined

#myname=""
mytestname=${myname-Kali}
echo ${mytestname}



# '-' not assign value if value is empty of variable

myname=""

mytestname=${myname-Kali}
echo ${mytestname}



# ':-' set value value var is empty

myname=""
mytestname=${myname:-Kali}
echo ${mytestname}

