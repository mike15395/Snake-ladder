#/bin/bash -x

echo "Welcome to Snake Ladder game!!"
position=0		# intial position before game starts
echo "STARTING WITH POSITION " $position

WIN_POINT=100	#constant
next=0

#functions created for each action : dice,roll,option selection,
#playing,next position

function dice()
{
	dice=$[(RANDOM%6) +1 ]
	echo "Dice" $dice

}

function option()
{
	option=$[(RANDOM%3)]
}

function play()
{
				curr_position=$position

				case $option in 
								0 ) #stay at same position
									curr_position=$curr_position
									echo "Stay here"
										;;

								1 ) #ladder move up
										echo "Ladder"
										curr_position=$[(curr_position+dice)]
										;;

								2 ) #snake move down
									curr_position=$[(curr_position-dice)]
									echo "Snake"
										;;
				esac

			echo "position" $curr_position
}

function nextpos()
{
	next=$[(next+curr_position)]

	if (( $next < 0 ))
	then
			next=$position
	elif (( $next > 100 ))
	then
			next=$[(next-curr_position)]
	fi

	echo "next position " $next
}


#Main code starts from here
count1=0
count2=0

while (( $next != WIN_POINT ))	#loops till win point 100 is reached
do
	flag=1						#flag is used to switch between player1 and player2

	if (( $flag == 1))
	then


		echo "Player1"

		dice										#each player rolls dice
		option									#then checks options :snake/ladder/stay
		play										#gets to next position
		((count1++))							#roll count for each player
		echo "Roll" $count1
		nextpos
			if (( $next == WIN_POINT))		#condition check if win point reached
			then									#yes then exit and print winner
					echo "Player1 WON!"
					break;
			fi
		flag=0
		echo " "
	fi

	echo " "

	if (( $flag == 0))					# the same goes for player2 as well
	then

		echo "Player 2"

		dice
		option
		play
		((count2++))
		echo "Roll"$count2
		nextpos
			if (( $next == WIN_POINT))
			then
					echo "Player2 WON!"
					break;
			fi
		flag=1
		echo " "
	fi

done
