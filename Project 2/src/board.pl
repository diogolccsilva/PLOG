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
	nl,
	cell(0,Value,Cell),
	nth1(X,Line,Cell).