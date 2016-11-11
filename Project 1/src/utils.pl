%Utility_functions


%%Check position R-C%%%

verify_position(B, R, C) :-
    checkPlaceAuxL(B, R, C, 1).

verify_positionAux([H|T], R, C, NR) :-
    NR \= R,
    NR1 is NR + 1,
    checkPlaceAuxR(T, R, C, NR1).
checkPlaceAuxR([H|T], R, C, NL) :-
    NR = R,
    checkPlaceAuxC(H, C, 1).

checkPlaceAuxC([H|T], C, NC) :-
    C \= NC,
    NC1 is NC+1,
    checkPlaceAuxC(T, R, NC1).
checkPlaceAuxC([H|T], R, NC) :-
    C = NC,
    checkSpot(H, 0).
	

	
%%	

	
	
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
	
	
	
	
		
	checkSpot([P, G], P1) :-
    P = P1.
	
%%% in dev still %%%%	
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

getPointP([P, G], [P, G]).
