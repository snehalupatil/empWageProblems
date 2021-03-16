#! /bin/bash


# Constant
IS_PRESENT=1


# Variable
empCheck=$(( RANDOM % 2))

# == -> -eq   < -> -lt   > -> -gt   <= -> -le   >=  -> -ge
if [ $IS_PRESENT -eq $empCheck ]
then
	echo "Employee is Present"
else
	echo "Employee is Absent"

fi


