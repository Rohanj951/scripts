#!/bin/bash

#case1

if [ "rohan" == "rohan" ]
then
	echo "both strings are equal"
fi

#########################################################################

#case2

if [ rohan == rohan ]
then
        echo "both strings are equal"
fi

###########################################################################

#case3

name="rohan"
if [ ${name} == "rohan" ]
then
        echo "both strings are equal"
fi

#########################################################################

echo "case4"

name=rohan jain
if [ ${name} == rohan jain ]
then
        echo "both strings are equal"
fi

###########################################################################

echo "case5"

name="rohan jain"
if [ "${name}" == "rohan jain" ]
then
        echo "both strings are equal"
fi

#########################################################################

echo "case6"

name="rohan jain"
othername="rohan jain"
if [[ ${name} == ${othername} ]]
then
        echo "both strings are equal"
fi

########################################################################

echo "case7"

name="rohan jain"
if [[ -n ${name} ]]
then
        echo "lenght of string is non-zero"
fi

#####################################################################

echo "case8"

name=""
if [[ -z ${name} ]]
then
        echo "lenght of string is zero"
fi

