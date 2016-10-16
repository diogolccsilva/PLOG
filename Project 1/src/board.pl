piece_empty([
    [' ',' ',' ',' ',' '],
    [' ',' ',' ',' ',' '],
    [' ',' ',' ',' ',' '],
    [' ',' ',' ',' ',' '],
    [' ',' ',' ',' ',' ']
    ]).

piece_empty(E).

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
    [' ',' ','W',' ',' '],
    [' ',' ',' ',' ',' '],
    [' ',' ',' ',' ',' ']]).

red_medium([
    [' ',' ',' ',' ',' '],
    [' ','W','W','W',' '],
    [' ','W','W','W',' '],
    [' ','W','W','W',' '],
    [' ',' ',' ',' ',' ']]).

red_big([
    ['W','W','W','W','W'],
    ['W','W','W','W','W'],
    ['W','W','W','W','W'],
    ['W','W','W','W','W'],
    ['W','W','W','W','W']]).

empty_board([
    [E,E,E,E,E,E,E,E,E],
    [E,E,E,E,E,E,E,E,E],
    [E,E,E,E,E,E,E,E,E],
    [E,E,E,E,E,E,E,E,E],
    [E,E,E,E,E,E,E,E,E],
    [E,E,E,E,E,E,E,E,E],
    [E,E,E,E,E,E,E,E,E],
    [E,E,E,E,E,E,E,E,E],
    [E,E,E,E,E,E,E,E,E]
    ]).



display_board([H|T]):- display_line(73), display_board_row(H,1), display_board(T).

display_board_row([H|T],N):- N<4, display_board_line(H,N), write('|\n'),N1 is N+1,display_board_row(T,N1).

display_board_line([H|T],N):- write('| '), nth1(N,H,R), display_piece_line(R), write(' '), display_board_line(T,N).

display_piece_line([H|T]):- write(H), display_piece_line(T).

display_line(N):- N>1, N1 is N-1, write('-'), display_line(N1).