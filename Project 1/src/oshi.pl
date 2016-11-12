%%%%Oshi Start%%%%%%

startgame :-

	default_board(B),
	display_board(B),
	
	askForMove(PR, PC, TR, TC),
	validate_move(B,PR,PC,TR,TC).
