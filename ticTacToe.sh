#!/bin/bash -x
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
resettingBoard
assigningLetterToPlayer
