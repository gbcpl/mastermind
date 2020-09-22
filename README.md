Mastermind game for The Odin Project courses on Ruby

Player vs Computer
12 turns to guess the combination of colours + position
4 positions and 6 colours (red (R), blue (B), green(G), yellow (Y), orange (O), violet (V))

First: build the game so that the computer selects randomly the colours for each position. 
The game asks the player what colour position 1 is, then position 2, etc. with an input gets
The input is stored in a variable. 
After all the input are given by the player, the game checks if that input == respective position.
If position + colour == true => puts a string that says that there is a valid position.
If only colour == true => puts a string that says that there is only a truc colour.
If false, do nothing.

Loop.

We need two arrays, one for the Player, one for the Computer.
We check array_player[0] == array_computer[O]
We check array_player[1] == array_computer[1]
We check array_player[1] == array_computer[1]
We check array_player[1] == array_computer[1]

array_player is shown after each turn.

First step done!

Second: Computer IA if chosen to play the Codemaker
One method to choose the code : easy, input and then store it in an array
One method where the computer has to guess between the 6 colours

Implement strategy
With the given strategy, computer can solve it in less than 5 moves.
This is indeed unbalanced vs the Player


There are 1296 possible codes => 6 * 6 * 6 * 6

@@array_random = ["B", "O", "V", "R", "G", "Y"]

Turn 1
BBBB

Turn 2
BOOO => we don't know where is B
Else
OOOO => we now know that this is V R G Y

Turn 3
BOVV => Turn 4 OBVV if 3 correct colours OR BORR Turn 5 => BOGY to have our 4 colours
Else
VRGY 

Turn 4
BOVR => possible win
Else
VRGY => possible win

Turn 4



Make replay own method => Done