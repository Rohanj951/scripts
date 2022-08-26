#!/bin/bash

a=10
b=5

echo "$((5+6))"
echo "$((a+b))"
echo "$((a-b))"
echo "$((a/b))"
echo "$((a*b))"
echo "$((a%b))"


echo "$((2**3))"   # mean 2*2*2 2 powers 3

((a++))  # a=a+1
 echo $a   # a= 11

((a+=2)) # a=a+2
echo $a  # a= 13

((a+=5))
echo $a  # a= 18


