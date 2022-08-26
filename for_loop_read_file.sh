#!/bin/bash
for word in "$(cat /etc/passwd)"
do 
	echo "${word}"
done
