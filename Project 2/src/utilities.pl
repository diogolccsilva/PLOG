
getNumbers(Board, NumbersList) :-
	length(Board, L),
	getNumbersAux(Board, 0, L, List),
	append(List, NumbersList).

getNumbersAux(_, N, N, []).

getNumbersAux(Board, Y, N, [H | T]) :-
	nth0(Y, Board, Row),
	getNumbersAuxRow(Row, 0, Y, N, H),
	Y1 is Y + 1,
	getNumbersAux(Board, Y1, N, T).

getNumbersAuxRow(_, N, _, N, []).

getNumbersAuxRow(Row, X, Y, N, [H | T]) :-
	nth0(X, Row, Number),
	Number \= -1,
	H = [Number, X, Y],
	X1 is X + 1,
	getNumbersAuxRow(Row, X1, Y, N, T).
	
getNumbersAuxRow(Row, X, Y, N, T) :-
	nth0(X, Row, Number),
	Number == -1,
	X1 is X + 1,
	getNumbersAuxRow(Row, X1, Y, N, T).
	


getCellValue(X, Y, Number, Board) :-
	nth0(Y, Board, Row),
	nth0(X, Row, Number).	
getCellValue(-1,-1,-1,_).

	
startNumberCells(Board, Indexed) :-
	getNumbers(Board, NumbersList),
	detailNumbers(NumbersList, Indexed).	
	
	

detailNumbers(Numbers, Indexed) :-
	detailNumbersAux(Numbers, 0,Indexed).
	
detailNumbersAux([], _, [] ).

detailNumbersAux([ NC | RC ], Index, [IH | IT] ) :-
	append([Index], NC, IH),
	Index1 is Index + 1,
	detailNumbersAux(RC, Index1, IT).




setCell(X,Y,Number,CurrBoard,NBoard):- 
	setCellAux(0,X,Y,Number,CurrBoard,NBoard), 
	!.

	
setCellAux(_,_,_,_,[],[]).
setCellAux(Y, X, Y, Number, [Row|T], [NRow|T2]):- 
	setCellAuxCol(0, X, Number, Row, NRow),
	CY is Y + 1,
	setCellAux(CY, X, Y, Number, T, T2).
setCellAux(CY, X, Y, Number, [Row|T], [Row|T2]) :- 	
	CY \= Y,
	Ynow2 is CY + 1,	
	setCellAux(Ynow2, X, Y, Number, T, T2).

setCellAuxCol(_,_,_,[],[]).
setCellAuxCol(X, X, Number, [_|T], [Number|T2]):-
	CX is X + 1,
	setCellAuxCol(CX, X, Number, T, T2).	
	
setCellAuxCol(CX, X, Number, [E|T], [H|T2]):-
	CX \= X,
	CX2 is CX + 1,
	H #= E,
	setCellAuxCol(CX2, X, Number, T, T2).
	

getColisions(X, Y, Board, Possibilities) :-
	getCellValue(X, Y, _, Board),
	
	getColision(X, Y, -1, 0, Board, Left),
	getColision(X, Y, 1, 0, Board, Right),
	getColision(X, Y, 0, -1, Board, Up),
	getColision(X, Y, 0, 1, Board, Down),
	Possibilities = [Up, Down, Right, Left].


getColision(_, -1, 0, -1, _, [-1,-1,-1]).
getColision(_, Y, 0, 1, Board, [-1,-1,-1]) :-
	length(Board, Y).

getColision(-1, _, -1, 0, _, [-1,-1,-1]).
getColision(X, _, 1, 0, Board, [-1,-1,-1]) :-
	length(Board, X).


getColision(X, Y, _, _, Board, Obstacle) :-
	getCellValue(X, Y, CurrVal, Board),
	CurrVal #\= -1,
	!,
	Obstacle = [CurrVal, X, Y].

getColision(X, Y, Xit, Yit, Board, Obstacle) :-	
	getCellValue(X, Y, _, Board),
	CX #= X + Xit,
	CY #= Y + Yit,	
	getColision(CX, CY, Xit, Yit, Board, Obstacle).

% A predicate to convert a list to a matrix of a given side.
% Used to convert the flattened out solution back into an easier-to-print matrix.

list_to_matrix([], _, []).
list_to_matrix(List, Size, [Row|Matrix]):-
	list_to_matrix_row(List, Size, Row, Tail),
	list_to_matrix(Tail, Size, Matrix).

list_to_matrix_row(Tail, 0, [], Tail).
list_to_matrix_row([Item|List], Size, [Item|Row], Tail):-
	NSize is Size-1,
	list_to_matrix_row(List, NSize, Row, Tail).
	