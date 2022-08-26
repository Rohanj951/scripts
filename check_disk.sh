#!/bin/bash
alert=90
backup_date=$(date "+%Y/%m/%d %H-%M-%S")
df -h | awk '{print $5 " " $1}' | while read output
do
	usage=$(echo $output | awk '{print $1}' | cut -d'%' -f1)
	file_sys=$(echo $output | awk '{print $2}')
      #  echo "$file_sys" 
	#echo $usage
	if [[ $usage -ge $alert ]]
	then
		echo "CRITICAL for $file_sys on $backup_date"
	#else
	#	echo "normal $file_sys on $backup_date"
	fi
done
