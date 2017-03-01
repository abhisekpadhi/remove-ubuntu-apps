#!/bin/bash
list=`sed ':a;N;$!ba;s/\n/ /g' remove-apps-list.txt`
read -p "Verbose or Quiet (v/q): " user_choice
case $user_choice in 
	v|V)
		for i in $list
		do 
			sudo apt-get remove --purge $i
			sudo apt-get autoremove 
		done
		;;
	q|Q)
		
		echo "Running in quiet mode, no output will be shown on screen." 
		for i in $list
		do
			sudo apt-get remove --purge -yqq $i
			sudo apt-get autoremove -yqq
		done &> /dev/null
		;;
	*)
		echo "Invalid choice \" $user_choice \", Please select only v or q" 
esac
