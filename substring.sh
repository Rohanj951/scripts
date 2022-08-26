#!/bin/bash

string="abcrohanabcxyz"

echo "${string:0}"    #same as {string} print the string 
echo "${string:1}"    #print the string from word having pos 1
echo "${string:2}"    #crohanabcxyz

echo "${string:0:3}"  # abc 
echo "${string:1:4}"  # bcro
echo "${string:3:3}"  # roh

echo "${string:-1}"   # abcrohanabcxyz
echo "${string: -1}"  # z 
echo "${string: -3}"  # xyz

echo "${string#a*c}"  # rohanabcxyz from starting check shorted match for a to c
echo "${string##a*c}" # xyz from starting check longest match for a to c


echo "${string%b*z}"  # abcrohana from ending check shorted match for z to b
echo "${string%%b*z}" # a from ending check longest match for z to b


string="abcrohanabcxyz"

echo "${string/abc}"  # rohanabcxyz remove one abc from starting 
echo "${string//abc}" # rohanxyz remove whole abc from starting to end


echo "${string/abc/xyz}"  # xyzrohanabcxyz from starting replace abc with xyz in starting
echo "${string//abc/xyz}"  # xyzrohanxyzxyz from starting replace abc with xyz in whole string

