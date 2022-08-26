#!/bin/bash
 while read line
 do 
	 echo ${line}
	 sleep 0.25
 done < /etc/passwd
