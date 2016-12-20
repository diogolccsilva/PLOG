displayBoard(Board):-
	length(Board,Length),
    displayNumbersLine(Length),
	displayLine(Length),
	displayBoardAux(Board,Length).

displayBoardAux([],_).
displayBoardAux(Board,Length):-
	displayBoardAux(Board,Length,1).

displayBoardAux([],_,_).
displayBoardAux([H|T],Length,N):-
	displayBoardLine(H,N),
	displayLine(Length),
	N1 is N + 1,
	displayBoardAux(T,Length,N1).

displayBoardLine([],_).
displayBoardLine(Line,N):-
	displayValue(N),
	displayBoardLine(Line).

displayBoardLine([]):-
	write('|'),
	nl.
displayBoardLine([(Type,Value)|T]):-
	Type \= 1,
	write('|'),
	displayValue(Value),
	displayBoardLine(T).
displayBoardLine([_|T]):-
	write('|  '),
	displayBoardLine(T).

displayValue(Value):-
	Value < 10,
	write(' '),
	write(Value).
displayValue(Value):-
	write(Value).

displayNumbersLine(Length):-
	write('  '),
    displayNumbersLine(Length,1).
displayNumbersLine(Length,N):-
    N =< Length,
    write(' '),
    displayValue(N),
    N1 is N + 1,
    displayNumbersLine(Length,N1).
displayNumbersLine(_,_):-
    nl.

displayLine(N):-
	write('  '),
	N1 is N*3 + 1,
	displayLineAux(N1).

displayLineAux(N):-
            N>0,
            N1 is N-1, 
            write('-'), 
            displayLineAux(N1).
displayLineAux(_):-
            nl.