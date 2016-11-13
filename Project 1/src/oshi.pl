/* Oshi game interface */

oshi :- 
	write('Welcome to Oshi!\n'),
	chooseGameMode.
	
chooseGameMode :-
	write('There are 4 game modes you can choose:\n'),
	write('1. Player vs Player;\n'),
	write('2. Player vs AI (easy);\n'),
	write('3. Player vs AI (hard);\n'),
	write('4. AI vs AI;\n'),
	write('Please choose one of the game modes listed above: '),
	read(GM),
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
	TURN = 0,
	display_board(B),
	askForMove(PR, PC, TR, TC),
	validate_move(B,PR,PC,TR,TC).
