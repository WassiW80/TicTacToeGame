#!/bin/bash 
echo "Weclome to Tic Tac Toe Game."
#constant
TOTAL_CELL=9

#variable
count=0
player=O
computer=X
winner=0
switchPlayer=1
#array declaration of array
declare -a board

function resettingBoard() {
	board=(. . . . . . . . . .)
}

function assigningLetterToPlayer() {
	if [ $((RANDOM%2)) -eq 0 ]
	then
		player=X
		computer=O
	fi
	echo "Assigned letter to player : $player"
   echo "Assigned letter to computer : $computer"
}

function tossToPlay() {
	if [ $((RANDOM%2)) -eq 0 ]
	then
		switchPlayer=0
		echo "Player go first."
	else
		switchPlayer=1
		echo "Computer go first."
	fi
}


function displayBoard() {
	echo "	${board[1]} ${board[2]} ${board[3]}"
	echo "	${board[4]} ${board[5]} ${board[6]}"
	echo "	${board[7]} ${board[8]} ${board[9]}"

}

function checkingEmptyCell() {
		if [[ $position -ge 1 && $position -le 9 ]]
		then
			if [[ ${board[$position]} == . ]]
			then
   			echo "Player's turn: "
				board[$position]=$player
				((count++))
			else
				echo "Cell is already occupied!!!"
			fi
			else
				echo "Invalid cell value!!!"
		fi
		displayBoard
		winningCondition $player
}

#function for checking winner
#1. condition for row checking
#2. condition for column checking
#3. condition for diagonals
#4. condition for anti-diagonals
function winningCondition() {
	for((i=1;i<=9;i=$(($i+3))))
	do
		if [[ ${board[$i]} == ${board[$i+1]} && ${board[$i+1]} == ${board[$i+2]} && ${board[$i+2]} == $1 ]]
		then
			winner=1
		fi
	done
	for((i=1;i<=3;i++))
	do
		if [[ ${board[$i]} == ${board[$i+3]} && ${board[$i+3]} == ${board[$i+6]} && ${board[$i]} == $1 ]]
		then
			winner=1
		fi
	done
	if [[ ${board[1]}  == ${board[5]} && ${board[5]} == ${board[9]} && ${board[5]} == $1 ]]
	then
		winner=1
	elif [[ ${board[3]}  == ${board[5]} && ${board[5]} == ${board[7]} && ${board[5]} == $1 ]]
	then
		winner=1
	fi
}

resettingBoard
assigningLetterToPlayer
#tossToPlay
displayBoard
while [[ $count -ne $TOTAL_CELL ]]
do
	read -p "Enter position between 1 to 9: " position
	checkingEmptyCell
	if [[ $winner -eq 1 ]]
	then
		echo Winner
		break
	fi
done
