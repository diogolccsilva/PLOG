
getPiece(Piece, Board,X,Y):-
	nth1(Y,Board,Row),
	nth1(X,Row,Piece),
	getPieceValue(Piece,Value),
	getPieceType(Piece,Type).
	
getPieceType((Type,_),Type).

getPieceValue((_,Value),Value).