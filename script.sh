#!/bin/bash

echo ""
echo "Welcome to the Mac OS X 10.6 Audit/Remediation Script Package"
echo "Based on DISA Mac OS X 10.6 STIG Draft, Version 1, Release .01, 18 Aug 2011"
echo "Copyright 2011, Jacqueline Singh"

# BEGIN

function press_enter
{
	echo ""
	echo -n "Press Return to continue"
	read
}

TODAYSDATE=`date +%d-%b-%Y.%H%M`

echo ""
echo "--------------------------------------------------------"
echo "Enter 1 to run Part 1: Automated tasks"
echo "Enter 2 to run Part 2: Semi-Automated Tasks"
echo "Enter 3 to run Part 3: GUI-Driven and Logical Tasks"
echo "--------------------------------------------------------"
echo "Enter 4 to exit the STIG Remediation Script"
echo "--------------------------------------------------------"
selection=
until [ "$selection" = "4" ]; do
echo ""
echo -n "Enter your selection:  "
echo ""
read selection
case $selection in
		1 ) exec bin/part1.sh 2>&1 | tee logs-$HOSTNAME/osx10.6_script.part1.$TODAYSDATE.log;;
		2 ) exec bin/part2.sh 2>&1 | tee logs-$HOSTNAME/osx10.6_script.part2.$TODAYSDATE.log;;
		3 ) exec bin/part3.sh 2>&1 | tee logs-$HOSTNAME/osx10.6_script.part3.$TODAYSDATE.log;;
		4 ) exit ;;
	esac
done

# END