piece_empty([
    [' ',' ',' ',' ',' '],
    [' ',' ',' ',' ',' '],
    [' ',' ',' ',' ',' '],
    [' ',' ',' ',' ',' '],
    [' ',' ',' ',' ',' ']
    ]).

white_small([
    [' ',' ',' ',' ',' '],
    [' ',' ',' ',' ',' '],
    [' ',' ','W',' ',' '],
    [' ',' ',' ',' ',' '],
    [' ',' ',' ',' ',' ']]).

white_medium([
    [' ',' ',' ',' ',' '],
    [' ','W','W','W',' '],
    [' ','W','W','W',' '],
    [' ','W','W','W',' '],
    [' ',' ',' ',' ',' ']]).

white_big([
    ['W','W','W','W','W'],
    ['W','W','W','W','W'],
    ['W','W','W','W','W'],
    ['W','W','W','W','W'],
    ['W','W','W','W','W']]).

red_small([
    [' ',' ',' ',' ',' '],
    [' ',' ',' ',' ',' '],
    [' ',' ','R',' ',' '],
    [' ',' ',' ',' ',' '],
    [' ',' ',' ',' ',' ']]).

red_medium([
    [' ',' ',' ',' ',' '],
    [' ','R','R','R',' '],
    [' ','R','R','R',' '],
    [' ','R','R','R',' '],
    [' ',' ',' ',' ',' ']]).

red_big([
    ['R','R','R','R','R'],
    ['R','R','R','R','R'],
    ['R','R','R','R','R'],
    ['R','R','R','R','R'],
    ['R','R','R','R','R']]).


%Create Board

create_board(H):- 
            length(H,9),
            create_rows(H).

create_rows([]).
create_rows([H|T]):- 
            length(H,9),
            create_pieces(H),
            create_rows(T).

create_pieces([]).
create_pieces([H|T]):- 
            piece_empty(H),
            create_pieces(T).
            
%Display Board

display_board(H):- 
            display_line(73),
            display_line(73), 
            display_board_aux(H).

displat_board_aux([]).
display_board_aux([H|T]):- 
            display_board_row(H,1), 
            display_board_aux(T).

display_board_row([],N).
display_board_row(H,N):-
            N>3,
            display_line(73).
display_board_row(H,N):- 
            N < 4,
            display_board_line(H,N), 
            write('|'),
            nl,
            N1 is N+1,
            display_board_row(H,N1).

display_board_line([],N).
display_board_line([H|T],N):- 
            write('| '), 
            nth1(N,H,R), 
            display_piece_line(R), 
            write(' '), 
            display_board_line(T,N).

display_piece_line([]).
display_piece_line([H|T]):- 
            write(H), 
            display_piece_line(T).

display_line(N):-
            N<1,
            nl.
display_line(N):-
            N>0,
            N1 is N-1, 
            write('-'), 
            display_line(N1).