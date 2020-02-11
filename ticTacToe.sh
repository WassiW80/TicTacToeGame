#!/bin/bash
echo "Weclome to Tic Tac Toe Game."
#constant
TOTAL_CELL=9

#variable
block=0
count=0
player=O
computer=X
turnChange=$player
winner=0
switchPlayer=1
position=1
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
	echo "	+-----+ "
	echo "	|${board[1]} ${board[2]} ${board[3]}|"
	echo "	|${board[4]} ${board[5]} ${board[6]}|"
	echo "	|${board[7]} ${board[8]} ${board[9]}|"
	echo "	+-----+ "
}

function switchPlayer() {
	echo "Player Letter is : $player || Computer Letter is : $computer"
	if [[ $switchPlayer == 0 ]]
	then
		echo "Player turn: "
		read -p "Enter position between 1 to 9: " position
		turnChange=$player
		checkingEmptyCell
		board[$position]=$player
		switchPlayer=1
	else
		echo "Computer turn: "
		computerPlayingToWin
		computerPlayingToBlock
		if [[ $block == 0 ]]
		then
			takeAvailableCorners
		fi
		switchPlayer=0
	fi
		winningCondition $turnChange
}

function checkingEmptyCell() {
	if [[ $position -ge 1 && $position -le 9 ]]
		then
			if [[ ${board[$position]} == . ]]
			then
			echo "............ $turnChange is placed at $position ............"
			((count++))
			else
				echo "Cell is already occupied!!!"
				switchPlayer
			fi
			else
				echo "Invalid cell value!!!"
				switchPlayer
		fi
}

#function for checking winner
#1. condition for row checking
#2. condition for column checking
#3. condition for diagonals
#4. condition for anti-diagonals
function winningCondition() {
	for((i=1;i<=$TOTAL_CELL;i=$(($i+3))))
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

function computerPlayingToWin() {
	for((j=1;j<=$TOTAL_CELL;j++))
	do
		if [[ ${board[$j]} == . ]]
		then
			board[$j]=$computer
			winningCondition $computer
			if [[ $winner -eq 1 ]]
			then
				displayBoard
				echo "Winner is $computer's"
				exit
			else
				board[$j]="."
			fi
		fi
	done
}

function computerPlayingToBlock() {
	for((k=1;k<=$TOTAL_CELL;k++))
	do
		if [[ ${board[$k]} == . ]]
		then
			board[$k]=$player
			winningCondition $player
			if [[ $winner -eq 1 ]]
			then
				board[$k]=$computer
				winner=0
				block=1
				((count++))
				displayBoard
				break
			else
				board[$k]="."
			fi
		fi
	done
}

function takeAvailableCorners() {
	for((l=1;l<=$TOTAL_CELL;l=$l+2))
	do
		if [[ $l == 5 ]]
		then
			l=$(($l+2))
		fi
		if [[ ${board[$l]} == . ]]
		then
			board[$l]=$computer
			((count++))
			break
		fi
	done
}

function checkingGameStatus() {
	if [[ $winner -eq 1 ]]
	then
		echo "Winner is $turnChange's"
		exit
	elif [[ $count -ge $TOTAL_CELL ]]
	then
		echo tie
	fi
}

resettingBoard
assigningLetterToPlayer
tossToPlay
displayBoard
while [[ $count -ne $TOTAL_CELL ]]
do
	switchPlayer
	clear
	displayBoard
	checkingGameStatus
done
