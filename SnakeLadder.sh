#/bin/bash -x

echo "Welcome to Snake Ladder game!!"
position=0

dice=$[(RANDOM%6) +1 ]
#echo $dice

option=$[(RANDOM%3)]

	case $option in 
					0 ) #stay at same position
						position=$position
							;;

					1 ) #ladder up
						position=$[(position+dice)]
							;;

					2 ) #snake down
						position=$[(position-dice)]
							;;
	esac

echo $position
