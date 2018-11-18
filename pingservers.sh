#!/usr/bin/env bash
#Script to take the ping of osrs worlds 1-99 to see which one is lowest ping
#####################
# @thatguytom__     #
# ign: JussWanaGame #
#####################

#begin
echo -e "\e[40;38;5;82m===SCRIPT STARTED===\e[49m"
echo

#Setting the hostname for ping command
domain=".runescape.com"
hostname="oldschool"
servernumber=1

#final url for the for loop
url="$hostname$servernumber$domain"

#setting the output file
FILE=".bestosrsservers"
#clear file
> $FILE

#begin loop at World 1 end at World 99
for servernumber in {1..99}; do

	#ping server and capture latency
    pingresult="$(ping -c1 $url | awk '{print $8}' | grep time)"

	#remove time= from variable
	pingresult="${pingresult//time=}"

	#remove decimal for simplicity sake
	pingresult=$(printf "%.0f\n" "$pingresult")
	
	#Less than 50 ping means green text
	if [ "$pingresult" -lt 50 ]; then
	
		#Prints low ping results to file
		echo -e "\e[42mWorld $servernumber has $pingresult ping.\e[49m"
		echo "World $servernumber - $pingresult ping" >> $FILE
	
	#between 50 and 100 gets yellow text
	elif [ "$pingresult" -gt 50 ] && [ "$pingresult" -lt 100 ]
	then
	
		#displays ping of mid range servers in yellow
		echo -e "\e[33mWorld $servernumber has $pingresult ping.\e[49m"
		
	else
		
		#displays ping of high ping servers in red
		echo -e "\e[41mWorld $servernumber has $pingresult ping.\e[49m"
		
	fi
	
	#server number incrementer for loop
	servernumber=$(expr $servernumber + 1)
	
	#url variable redefinition for loop
	url="$hostname$servernumber$domain"
	
#end of loop	
done

#pause so last server gets printed
sleep 1s
#gets rid of color formatting in console
reset

#print next screen header
echo -e "\e[44;93m  _____                   "
echo -e " |  __ \                  "
echo -e " | |  | | ___  _ __   ___ "
echo -e " | |  | |/ _ \| '_ \ / _ \ "
echo -e " | |__| | (_) | | | |  __/ "
echo -e " |_____/ \___/|_| |_|\___| "
echo -e "                          \e[49;39m"
echo

#prints lowest ping worlds
echo -e "\e[42mThe lowest ping worlds: "
cat .bestosrsservers
echo -e "\e[49m"
read -p "Press enter to continue..."

#gets rid of green color formatting
reset

#asks if user wants to save hidden world list to .txt file
echo "Save list of best servers to bestservers.txt? (y/n)"

#get answer from user
read answer
if [ "$answer" == "y" ]; then
	#overwrites or creates file
	touch bestservers.txt
	cat .bestosrsservers > bestservers.txt
	echo "bestservers.txt has been saved to the working directory."
	echo
	read -p "Press enter to continue..."
else
	#removes files if no
	echo "Didn't save to bestservers.txt, removing file if exists..."
	rm -f bestservers.txt
	echo
	read -p "Press enter to continue..."
fi

#remove best servers temp file
rm -f .bestosrsservers

#clear
clear

#END OF SCRIPT
