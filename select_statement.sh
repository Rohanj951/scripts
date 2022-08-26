#!/bin/bash


PS3="Please select the os? "
select os in Linux Windows Mac
do
	echo "you select the ${os}"
	break;
done


PS3="Please select the os? "
select os in Linux Windows Mac
do 
	case ${os} in
		Linux)
			echo "you select the linux"
			break
			;;
		Windows)
			echo " you select the windows "
			break
			;;
		Mac)
			echo "you select the Mac"
			break
			;;
		*)
			echo "Invalid option, please select again"
			;;
	esac

done
