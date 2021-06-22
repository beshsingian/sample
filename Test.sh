#!/bin/bash
clear

echo "Welcome!"

whole()
{
echo "Please select action to take:"
echo "[A] - Add Entries"
echo "[D] - Delete Entries"
echo "[U] - Update Entries"
echo "[S] - Search Entries"
echo "[T] - Show All Entries"
read select
if [ $select == A ] || [ $select == a ]
then
	echo "Enter name:"
	read uname
	echo "Enter age:"
	read uage
	echo "Enter Address:"
	read uadd
	echo "---------------------------------------"
	echo "$uname, $uage, $uadd - Added to database!"
	echo "---------------------------------------"
	echo $uname, $uage, $uadd >> database.txt
		elif [ $select == D ] || [ $select == d ]
		then
			echo "Enter name, age, location to be deleted:"
			read udel
			udel1="$(grep -c $udel database.txt )"
			if [ $udel1 == "0" ]
			then
			echo "No similar entries found"
			else
			echo "$(grep "$udel" database.txt | sed "/$udel/d" database.txt)" > database.txt
			echo "-------------------------------"
			echo "The name was deleted!"
			echo "-------------------------------"
			fi
		elif [ $select == U ] || [ $select == u ]
		then
			echo "Enter the name you want to update:"
			read uup
			uup1="$(grep -c $uup database.txt )"
			if [ $uup1 == "0" ]
			then
			echo "No similar entries found"
			else
			grep "$uup" database.txt
			echo "Enter new name, age, location:"
			read new
			echo "$(grep "$uup" database.txt | sed "/$uup/d" database.txt)" > database.txt
			#echo "$(grep "$uup" database.txt | sed "s/$uup/$new/" database.txt)" > database.txt
			echo $new >> database.txt
			echo "Record Updated"
			fi
		elif [ $select == S ] || [ $select == s ]
		then
			clear
			echo "Search Name:"
			read usear
			usear1="$(grep -ic $usear database.txt )"
			if [ $usear1 == "0" ]
			then
			echo "-------------------------------"
			echo "No similar entries found."
			echo "-------------------------------"
			else
			echo "-------------------------------"
			echo "We found the similar entries below."
			grep -i "$usear" database.txt
			echo "-------------------------------"
			fi
		elif [ $select == T ] || [ $select == t ]
		then
			clear
			echo "$(cat database.txt)"
fi
}
whole

loop ()
{
	echo "Do you want to select another action? Y/N"
	read select2
		if [ $select2 == Y ] || [ $select2 == y ]
		then clear
		whole
		loop
		elif [ $select2 == N ] || [ $select2 == n ]
		then exit
		elif [ $select2 != Y ] || [ $select2 != y ] || [ $select2 != N ] || [ $select2 != n ]
		then
		clear
		echo "You have entered a wrong choice!"
		loop	
		fi
}
loop		
