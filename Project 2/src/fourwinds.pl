:- use_module(library(clpfd)).
:- use_module(library(lists)).




	
	

getPiece(Piece, Board,X,Y):-
	nth1(Y,Board,Row),
	nth1(X,Row,Piece),
	getPieceValue(Piece,Value),
	getPieceType(Piece,Type).
	
getPieceType((X,Y),Type):-
	Type is X.

getPieceValue((X,Y),Value):-
	Value is Y.