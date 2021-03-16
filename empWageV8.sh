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

declare -a dailyWages

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

function calwageForDay(){
	local empHrs=$1
	echo $(( $EMP_RATE_PER_HR * $empHrs ))
}


while [ $totalWorkingDays -lt $MAX_WORKING_DAYS ] && [ $totalWorkingHours -lt $MAX_WORKING_HOUR ]
do

	# Variable
	empCheck=$(( RANDOM % 3))

	totalworkingDays=$(( $totalworkingDays + 1))

	# == -> -eq   < -> -lt   > -> -gt   <= -> -le   >=  -> -ge
	empHrs="$( getWorkingHours $empCheck )"

	totalWorkingHours=$(( $totalWorkingHours + $empHrs ))
	dailywages[$totalWorkingDays]="$( calwageForDay $empHrs)"

done
echo ${!dailywages[*]}
echo ${dailywages[*]}

salary=$(( $totalWorkingHours * $EMP_RATE_PER_HR ))


