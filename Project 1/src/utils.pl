/* Utility_functions */


/* Check position */

return_position(B,R,C,POS):-
	return_positionAuxR(B,R,C,1,POS).
	
return_positionAuxR([H|T],R,C,NR,POS) :-
	NR \= R,
	NR1 is NR +1,
    return_positionAuxR(T,R,C,NR1,POS).
return_positionAuxR([H|T],R,C,NR,POS):-
	NR = R,
    return_positionAuxC(H,C,1,POS).

return_positionAuxC([H|T],C,NC,POS):-
	C\= NC,
	NC1 is NC+1,
	return_positionAuxC(T,C,NC1,POS).
return_positionAuxC([H|T],C,NC,POS):-
	C = NC,
	reportPosition(H,POS).
		
reportPosition(H,POS) :-
	POS is H.


/* Check Piece at location */

validate_move(B,PR,PC,TR,TC):-
	return_position(B,PR,PC,T),
	check_piece(T,PR,PC,TR,TC).

check_piece(T,PR,PC,TR,TC):-
	T = 0,
	write('Not a valid piece location').
check_piece(T,PR,PC,TR,TC):-
	(T = 1; T == 4),
	write('1 block piece'),
	valid_location(1,PR,PC,TR,TC).	
check_piece(T,PR,PC,TR,TC):-
	(T == 2; T == 5),
	write('2 blocks piece'),
	valid_location(2,PR,PC,TR,TC).
check_piece(T,PR,PC,TR,TC):-
	(T == 3; T == 6),
	write('3 blocks piece'),	
	valid_location(3,PR,PC,TR,TC).

valid_location(V,PR,PC,TR,TC):-
	PR = TR,
	valid_locationAux(V,PC,TC).		
valid_location(V,PR,PC,TR,TC):-
	PC = TC,
	valid_locationAux(V,PR,TR).		
valid_locationAux(V,A1,A2):-
	A3 is A1 - A2,
	abs(A3) < V+1,
	nl,
	write('valid movement').		
	

%Input functions 


/*piece row piece collumn target row target collumn */
askForMove(PR, PC, TR, TC):-
	nl,
    write('Choose Row of Piece to move (1 to 9): '),
    read(PR),
    write('Choose Collumm of Piece to move (1 to 9): '),
    read(PC),
	write('Choose target Row (1 to 9): '),
    read(TR),
    write('Choose target Collumm (1 to 9): '),
    read(TC).

	
	
/* Count pieces for each color */

count_total(B,C):-
	count_white(B,C1),
	count_red(B,C2),
	C is C1 + C2.

count_white(B,C):-
	count_pieces(B,4,0,C).

count_red(B,C):-
	count_pieces(B,7,0,C).

count_pieces([H|T],N,A,C):-
	count_pieces_aux(H,N,A,C1),
	count_pieces(T,N,C1,C).
count_pieces([],_,C,C).

count_pieces_aux([],_,C,C).
count_pieces_aux([H|T],N,A,C):-
	(H < N, H > N - 4),
	A1 is A+1,
	count_pieces_aux(T,N,A1,C).
count_pieces_aux([H|T],N,A,C):-
	count_pieces_aux(T,N,A,C).		
	

/* this is trash so far */

/*
checkSurroundings(B, R, C, P) :-
    R1 is R + 1,
    R2 is R - 1,
    C1 is C + 1,
    C2 is C - 1,
    checkNotAdjacentAuxL(B, R1, C, P, 1),
    checkNotAdjacentAuxL(B, R2, C, P, 1),
    checkNotAdjacentAuxL(B, R, C1, P, 1),
    checkNotAdjacentAuxL(B, R, C2, P, 1).

checkAdjacentFreeSpace(B, R, C) :-
    R1 is R + 1,
    getCoord(B, R1, C, X),
    checkSpot(X, 0).
checkAdjacentFreeSpace(B, R, C) :-
    R2 is R - 1,
    getCoord(B, R2, C, X),
    checkSpot(X, 0).
checkAdjacentFreeSpace(B, R, C) :-
    C1 is C + 1,
    getCoord(B, R, C1, X),
    checkSpot(X, 0).
checkAdjacentFreeSpace(B, R, C) :-
    C2 is C - 1,
    getCoord(B, R, C2, X),
    checkSpot(X, 0).	
*/
	
	
		

	
/* in dev still */

/*	
getCoord(B, C, L, X) :-
    getCoordR(B, C, L, X, 1).

getCoordR([], C, L, [-1, -1], NL).
getCoordR([H|T], C, L, [-1, -1], NL) :-
    L = 0, !.
getCoordR([H|T], C, L, [-1, -1], NL) :-
    C = 0, !.
getCoordR([H|T], C, L, X, NL) :-
    NL \= L,
    NL1 is NL + 1,
    getCoordR(T, C, L, X, NL1).
getCoordR([H|T], C, L, X, NL) :-
    NL = L,
    getCoordL(H, C, X, 1).

getCoordL([], C, [-1, -1], NC).
getCoordL([H|T], C, X, NC) :-
    C \= NC,
    NC1 is NC+1,
    getCoordL(T, C, X, NC1).
getCoordL([H | T], C, X, NC) :-
    C = NC,
    getPointP(H, X).

getPointP([P, G], [P, G]). */