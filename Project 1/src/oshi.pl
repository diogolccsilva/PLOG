/* Oshi game interface */

oshi :- 
	write('Welcome to Oshi!\n'),
	chooseGameMode.
	
chooseGameMode :-
	write('There are 4 game modes you can choose:\n'),
	write('1. Player vs Player;\n'),
	write('2. Player vs AI (easy); (WIP)\n'),
	write('3. Player vs AI (hard); (WIP)\n'),
	write('4. AI vs AI; (WIP)\n'),
	write('Please choose one of the game modes listed above: '),
	read(GM),
	nl,
	startGame(GM).

startGame(GM):-
	GM = 1,
	default_board(B),
	game(B,0).
startGame(GM):-
	GM = 2.
startGame(GM):-
	GM = 3.
startGame(GM):-
	GM = 4.
startGame(GM):-
	write('Option '),
	write(GM),
	write(' is not a valid game mode!\n'),
	chooseGameMode.

game(B,TURN):-
	display_board(B),
	game_status(B),
	game_turn(TURN),
	askForPiece(PR, PC),
	check_game(B),
	NT is TURN + 1,
	game(B,NT).
game(B,_):-
	write('End of game!\n').

game_status(B):-
	count_white(B,W),
	count_red(B,R),
	write('(White - '),
	write(W),
	write(') (Red - '),
	write(R),
	write(')\n').

game_turn(TURN):-
	CK is mod(TURN,2),
	CK \= 0,
	write('Red\'s turn\n').
game_turn(TURN):-
	CK is mod(TURN,2),
	CK = 0,
	write('White\'s turn\n').

check_game(B):-
	count_red(B,C),
	C = 0,
	write('White wins, congrats!\n'),
	fail.
check_game(B):-
	count_white(B,C),
	C = 0,
	write('Red wins, congrats!\n'),
	fail.
check_game(B).

askForPiece(PR, PC):-
	askForRow(PR),
	askForCol(PC).

askForRow(PR):-
	repeat,
	write('Choose Row of Piece to move (1 to 9): '),
    read(PR),
	nl,
	(PR < 10, PR > 0),
	!.

askForCol(PC):-
	repeat,
	write('Choose Collumm of Piece to move (1 to 9): '),
    read(PC),
	nl,
	(PC < 10, PC > 0),
	!.