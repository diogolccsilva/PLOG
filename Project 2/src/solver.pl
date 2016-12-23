:- use_module(library(clpfd)).

%solve(-Board)
solve(Board):-
    setLines(Board).
    %labelBoard(Board).

setLines([]).
setLines([H|T]):-
    setCols(H),
    setLines(T).

setCols([]).
setCols([H|T]):-
    setCell(H),
    setCols(T).

setCell((Type,Value)):-
    Type \= 1.
setCell((Type,Value)):-
    Value in 0..3,
    indomain(Value),
    Type is 1.

/*labelBoard(Board):-
    findall(Value,(length(Board,Length),nth1(I,Board,Row),nth1(J,Row,(Type,Value)),I<Length,J<Length,Type\=0),List),
    domain(List,0,3),
    labeling([],List),
    write(List).
*/
