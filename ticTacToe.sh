##!/bin/bash -x
echo "Weclome to Tic Tac Toe Game."
player=O
#array declaration of array
declare -a board

function resettingBoard() {
	board=(. . . . . . . . .)
}

function assigningLetterToPlayer() {
	if [ $((RANDOM%2)) -eq 0 ]
	then
		player=X
	fi
	echo "Assigned letter to player : $player"

}

function tossToPlay() {
	if [ $((RANDOM%2)) -eq 0 ]
	then
		echo "Player go first."
	else
		echo "Player go second."
	fi
}


function displayBoard() {
	echo "	${board[0]} ${board[1]} ${board[2]}"
	echo "	${board[3]} ${board[4]} ${board[5]}"
	echo "	${board[6]} ${board[7]} ${board[8]}"

}

function checkingEmptyCell() {
	if [[ $position -ge 0 && $position -le 8 ]]
	then
		if [[ ${board[$position]} == . ]]
		then
			board[$position]=$player
		else
			echo "Cell is already occupied!!!"
		fi
		else
			echo "Invalid cell value!!!"
	fi
	displayBoard
}

resettingBoard
assigningLetterToPlayer
tossToPlay
displayBoard
read -p "Enter position between 0 to 8: " position
checkingEmptyCell
