/* -*- Mode:Prolog; coding:iso-8859-1; indent-tabs-mode:nil; prolog-indent-width:8; prolog-paren-indent:3; tab-width:8; -*- */

:- use_module(library(lists)).

/*	Type - 0 if number, 1 if arrow
	Value (arrow) - 0 North, 1 South, 2 East, 3 West
*/
%cell(-Type, -Value, +Cell)
cell(Type,Value,(Type,Value)).

%createBoard(+Board, -Size)
createBoard(Board,Size):-
	createBoard(Board,Size,Size).
createBoard(Board,Width,Height):-
	length(Board,Height),
	createLines(Board,Width).

createLines([],_).
createLines([H|T],Width):-
	length(H,Width),
	createCells(H),
	createLines(T,Width).

createCells([]).
createCells([H|T]):-
	cell(_,_,H),
	createCells(T).

addNumberedCells(_,[]).
addNumberedCells(Board,[(Position,Value)|T]):-
	addNumberedCell(Board,Position,Value),
	addNumberedCells(Board,T).

addNumberedCell(Board,(X,Y),Value):-
	nth1(Y,Board,Line),
	cell(0,Value,Cell),
	nth1(X,Line,Cell).

%
fillNumberedCells(_,[]).
fillNumberedCells(Board,[(Position,_)|T]):-
	addNumberedCell(Board,Position,-1),
	fillNumberedCells(Board,T).

%
addArrowCells(Source,Destination):-
	addArrowRows(Source,Destination).
addArrowRows([],[]).
addArrowRows([SH|ST],[DH|DT]):-
	addArrowCols(SH,DH),
	addArrowRows(ST,DT).
addArrowCols([],[]).
addArrowCols([SH|ST],[(Type,Value)|DT]):-
	Type = 0,
	Value = SH,
	addArrowCols(ST,DT).
addArrowCols([_|ST],[_|DT]):-
	addArrowCols(ST,DT).

%convertBoard(-Board, +NewBoard)
convertBoard(Board,NewBoard):-
    convertRows(Board,NewBoard).
 
convertRows([],[]).
convertRows([BH|BT],[NBH|NBT]):-
    convertCells(BH,NBH),
    convertRows(BT,NBT).
 
convertCells([],[]).
convertCells([(Type,Value)|T],[H|T1]):-
    Type\=1,
    H is Value,
    convertCells(T,T1).
convertCells([_|T],[-1|T1]):-
    convertCells(T,T1).

%
reverseBoard(Board,Numbers,NewBoard):-
	length(Board,Size),
	createBoard(NewBoard,Size),
	fillNumberedCells(NewBoard,Numbers),
	addArrowCells(Board,NewBoard).

%
getNumbersList(Board, ListNumbers) :-
	length(Board, N),
	M is N+1,
	getNumbersListAux(Board, 1, M, PrevList),
	flatten_list(PrevList, ListNumbers).

getNumbersListAux(_, N, N, []).
getNumbersListAux(Board, Y, N, [Head | Tail]) :-
	nth1(Y, Board, Row),
	getNumbersListAuxRow(Row, 1, Y, N, Head),
	Y1 is Y + 1,
	getNumbersListAux(Board, Y1, N, Tail).

getNumbersListAuxRow(_, N, _, N, []).
getNumbersListAuxRow(Row, X, Y, N, [Head | Tail]):-
	nth1(X, Row, (T,V)),
	T \= 1, 
	Head = ((X,Y),V),
	X1 is X + 1,
	getNumbersListAuxRow(Row, X1, Y, N, Tail).
 
getNumbersListAuxRow(Row, X, Y, N, Tail) :-
	nth1(X, Row, (T,V)),
	X1 is X + 1,
	getNumbersListAuxRow(Row, X1, Y, N, Tail).

flatten_list([], []).
flatten_list( [HeadList| TailList], Result) :- 
	flatten_list( TailList, NewTailList), 
 	!, 
 	append(HeadList, NewTailList, Result).
	flatten_list( [ HeadList | Tail ], [ HeadList | OtherTail ]) :- 
	flatten_list( Tail, OtherTail).