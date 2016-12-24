restricts(Board,Result,Detailed,CellDomain):-

	restrictCell(Board,Result),
	restrictResults(Detailed, Result, 0, CellDomain),
	
	checkConectivity(Detailed, Result, 0, CellDomain).



restrictCell(Board, Results) :-
	length(Board, N),
	restrictRow(Board, Results, 0, N).
	
	
restrictRow(_, _, N,N).
restrictRow(Board, Results, Y, N) :-
	restrictCols(Board, Results, 0, Y, N),
	Y1 #= Y + 1,
	restrictRow(Board, Results, Y1, N).
	
	
restrictCols(_,_, N, _, N).
restrictCols(Board, Results, X, Y, N) :-
	getColisions(X,Y,Board,[[_,UX,UY],[_,DX,DY],[_,LX,LY],[_,RX,RY]]),
	getCellValue(UX, UY, UP, Results),
	getCellValue(DX, DY, DOWN, Results),
	getCellValue(LX, LY, LEFT, Results),
	getCellValue(RX, RY, RIGHT, Results),
	getCellValue(X,Y,Options,Results),
	Options in {RIGHT,LEFT,UP,DOWN},
	Options #>= 0,
	X1 #= X + 1,
	restrictCols(Board, Results, X1, Y, N).
	
	
getCount(Index, _, Results, CountResult) :-
	length(Results, N),
	getCountRows(0, N, Index, Results, CountResult).

getCountRows(N,N,_,_,0).
getCountRows(Y,N,Index,Results,CountResult):-
	getCountCols(0,Y,N,Index,Results,CurrCount),
	Y1 #= Y + 1,
	getCountRows(Y1, N, Index, Results, RestCount),
	CountResult #= RestCount + CurrCount.

getCountCols(N, _, N, _, _, 0).
getCountCols(X, Y, N, Index, Results, CountResult) :-

	getCellValue(X, Y, RestrainV, Results),
	RestrainV #= Index #<=> B,
	X1 #= X + 1,
	getCountCols(X1, Y, N, Index, Results, CurrCount),
	CountResult #= CurrCount + B.
	
restrictResults(_,_, Length, Length).
restrictResults(Detailed, Results, Index, Length) :-	
	restrictResult(Index, Detailed, Results,_),
	NIndex #= Index + 1,
	restrictResults(Detailed, Results, NIndex, Length).

restrictResult(Index, Detailed, Results, CountResult) :-
	member([Index, CountD, _, _], Detailed),
	Count #= CountD + 1,
	getCount(Index, _, Results, CountResult), 
	CountResult #= Count.
