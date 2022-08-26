##### want to take input from variable

#!/bin/bash

read -p "please enter your name " name
read -p "please enter your age " age
read -p "please neter your password " -s  password  # -s for security
#read 

echo #to seperate the output line from input line#
echo "my name is ${name} and my is age is ${age} and your pass is ${password}"

echo "${REPLAY}"
