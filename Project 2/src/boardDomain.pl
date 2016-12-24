startEmptyBoard(N, CellRegion, Result):-
	startEmptyBoardAux(N, N, Result),
	constrainDomain(CellRegion, Result).

startEmptyBoardAux(_,0,[]).
startEmptyBoardAux(N, NN, [H|T]):-
	length(H,N),
	NN > 0,
	NN1 is NN - 1,
	startEmptyBoardAux(N,NN1,T).

constrainDomain(_,[]).
constrainDomain(CellRegion,[H|T]):-
	domain(H,0,CellRegion),
	constrainDomain(CellRegion,T).

	

startCellArea(Board, [], Board).
startCellArea(Board,[[CurrIndex,_,X,Y]|T], Result):-
	setCell(X, Y, CurrIndex, Board, NBoard),
	startCellArea(NBoard, T, Result).

	
checkConectivity(_,_, Length, Length).
checkConectivity(Detailed, Results, Index, Length) :-	
	checkConectivityAux(Detailed, Results, Index),
	IndexNew #= Index + 1,
	checkConectivity(Detailed, Results, IndexNew, Length).

checkConectivityAux(Detailed, Results, Index) :-
	member([Index, CellSum, X, Y], Detailed),

	checkUp(Index, Results, X, Y, CellUp),
	SumUp #= CellUp - 1,
	
	checkDown(Index, Results, X, Y, CellDown),
	SumDown #= CellDown - 1,
	
	checkRight(Index, Results, X, Y, CellRight),
	SumRight #= CellRight - 1,
	
	checkLeft(Index, Results, X, Y, CellLeft),
	SumLeft #= CellLeft - 1,
	
	CellSum #= SumUp + SumDown + SumLeft + SumRight.

checkUp(_, _, _, -1, 0).
checkUp(Index, Results, X, Y, Sum) :-
	getCellValue(X, Y, RestrainV, Results),
	RestrainV #= Index,
	NY #= Y - 1,
	checkUp(Index, Results, X, NY, NSum),
	Sum #= NSum + 1.
	
checkUp(Index, Results, X, Y, Sum) :-
	getCellValue(X, Y, RestrainV, Results),
	RestrainV #\= Index,
	Sum #= 0.

checkDown(_, Results, _, Y, 0) :-
length(Results, Y). 

checkDown(Index, Results, X, Y, Sum) :-
	getCellValue(X, Y, RestrainV, Results),
	RestrainV #= Index,
	NY #= Y + 1,
	checkDown(Index, Results, X, NY, NSum),
	Sum #= NSum + 1.
	
checkDown(Index, Results, X, Y, Sum) :-
	getCellValue(X, Y, RestrainV, Results),
	RestrainV #\= Index,
	Sum #= 0.

checkLeft(_, _, -1, _, 0).
checkLeft(Index, Results, X, Y, Sum) :-
	getCellValue(X, Y, RestrainV, Results),
	RestrainV #= Index,
	NX #= X - 1,
	checkLeft(Index, Results, NX, Y, NSum),
	Sum #= NSum + 1.
	
checkLeft(Index, Results, X, Y, Sum) :-
	getCellValue(X, Y, RestrainV, Results),
	RestrainV #\= Index,
	Sum #= 0.

checkRight(_, Results, X, _, 0) :- 
length(Results, X). 

checkRight(Index, Results, X, Y, Sum) :-
	getCellValue(X, Y, RestrainV, Results),
	RestrainV #= Index,
	NX #= X + 1,
	checkRight(Index, Results, NX, Y, NSum),
	Sum #= NSum + 1.
	
checkRight(Index, Results, X, Y, Sum) :-
	getCellValue(X, Y, RestrainV, Results),
	RestrainV #\= Index,
	Sum #= 0.	