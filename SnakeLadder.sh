#/bin/bash -x

echo "Welcome to Snake Ladder game!!"
position=0
echo "STARTING WITH POSITION " $position
next=0
WINNING_POINT=100

while true
do
	dice=$[(RANDOM%6) +1 ]
	echo "Dice" $dice

	option=$[(RANDOM%3)]
	curr_position=$position

		case $option in 
						0 ) #stay at same position
							curr_position=$curr_position
							echo "Stay here"
								;;

						1 ) #ladder up
							curr_position=$[(curr_position+dice)]
							echo "Ladder"
								;;

						2 ) #snake down
							curr_position=$[(curr_position-dice)]
							echo "Snake"
								;;
		esac

		#if (( $curr_position < 0))
		#then
		#		curr_position=$position
		#fi

	echo "current position " $curr_position

	next=$[(next+curr_position)]
	if (( $next < 0 ))
	then
			next=$position
	fi

	if (( $next == $WINNING_POINT ))
	then
			break;
	fi

	echo "next position" $next
	echo " "
done
