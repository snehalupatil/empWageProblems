#! /bin/bash -x


# Constant
IS_PRESENT_FULL_TIME=1
IS_PRESENT_PART_TIME=2
EMP_RATE_PER_HR=20
MAX_WORKING_DAYS=20
MAX_WORKING_HOUR=90

# variable

totalWorkingHours=0
totalWorkingDays=0


function getWorkingHours(){
	local empCheck=$1
        local empHrs=0

        case $empCheck in

                $IS_PRESENT_FULL_TIME)
                        empHrs=8;;

                $IS_PRESENT_PART_TIME)
                        empHrs=4;;
                *)
                        empHrs=0;;
        esac
        echo $empHrs



        }
while [ $totalWorkingDays -lt $MAX_WORKING_DAYS ] && [ $totalWorkingHours -lt $MAX_WORKING_HOUR ]
do

	# Variable
	empCheck=$(( RANDOM % 3))
	((totalWorkingDays++))

	# == -> -eq   < -> -lt   > -> -gt   <= -> -le   >=  -> -ge
	empHrs="$( getWorkingHours $empCheck )"

	totalWorkingHours=$(( $totalWorkingHours + $empHrs ))

done

salary=$(( $totalWorkingHours * $EMP_RATE_PER_HR ))


