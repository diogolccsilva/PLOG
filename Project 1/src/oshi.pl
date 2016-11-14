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
	GM >= 1,
	GM =< 4,
	default_board(B),
	game(GM,B,0).
startGame(GM):-
	write('Option '),
	write(GM),
	write(' is not a valid game mode!\n'),
	chooseGameMode.

game(GM,B,TURN):-
	GM = 1,
	PL is mod(TURN,2),
	display_board(B),
	game_status(B),
	game_turn(PL),
	repeat,
	askForPiece(B,PR,PC,P,PL),
	askForMove(D,N,P),
	check_move(B,PR,PC,N,D),
	move(B,PR,PC,N,D,NB),
	!,
	check_game(NB),
	NT is TURN + 1,
	game(GM,NB,NT).
game(GM,B,TURN):-
	GM = 2,
	PL is mod(TURN,2),
	display_board(B),
	game_status(B),
	game_turn(PL),
	repeat,
	randomPiece(B,PR,PC,P,PL),
	randomMove(D,N,P),
	check_move(B,PR,PC,N,D),
	move(B,PR,PC,N,D,NB),
	!,
	check_game(NB),
	NT is TURN + 1,
	game(GM,NB,NT).
game(GM,B,TURN):-
	GM >= 3,
	GM =< 4,
	write('WORK IN PROGRESS\n').
game(_,B,_):-
	write('End of game!\n').

game_status(B):-
	count_points_white(B,W),
	count_points_red(B,R),
	write('Points (White - '),
	write(W),
	write(') (Red - '),
	write(R),
	write(')\n').

game_turn(PL):-
	PL \= 0,
	write('Red\'s turn\n').
game_turn(PL):-
	PL = 0,
	write('White\'s turn\n').

check_game(B):-
	count_points_red(B,C),
	C < 7,
	write('White wins, congrats!\n'),
	fail.
check_game(B):-
	count_points_white(B,C),
	C < 7,
	write('Red wins, congrats!\n'),
	fail.
check_game(B).

askForPiece(B,PR,PC,P,PL):-
	repeat,
	askForRow(PR),
	askForCol(PC),
	return_position(B,PR,PC,P),
	PL1 is P//4,
	(P \= 0, PL1 = PL),
	!.

askForRow(PR):-
	repeat,
	write('Choose Row of Piece to move (1 to 9): '),
    read(PR),
	(PR < 10, PR > 0),
	!.

askForCol(PC):-
	repeat,
	write('Choose Collumm of Piece to move (1 to 9): '),
    read(PC),
	(PC < 10, PC > 0),
	!.

askForMove(D,N,P):-
	askForDirection(D),
	askForNumMoves(N,P).

askForDirection(D):-
	repeat,
	write('Directions:\n'),
	write('0. Right;\n'),
	write('1. Left;\n'),
	write('2. Down;\n'),
	write('3. Up;\n'),
	write('Choose in which direction you want to move: '),
	read(D),
	(D>=0,D=<3),
	!.

askForNumMoves(N,P):-
	repeat,
	write('Choose the number of blocks you want to move: '),
	read(N),
	(N=<mod(P,4)),
	!.