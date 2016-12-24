/* -*- Mode:Prolog; coding:iso-8859-1; indent-tabs-mode:nil; prolog-indent-width:8; prolog-paren-indent:3; tab-width:8; -*- */


boardTest(B,1):-
    createBoard(B,12),
    addNumberedCells(B,[((5,1),10),((1,2),2),((7,2),5),((3,3),6),((11,3),7),((12,4),12),((4,5),9),((11,5),1),((9,6),7),((2,7),4),((8,7),8),((1,8),9),((5,8),1),((11,8),4),((2,9),5),((7,10),6),((10,10),1),((3,11),8),((12,11),6),((9,12),13)]).

boardTest(B,2):-
    createBoard(B,5),
    addNumberedCells(B,[((4,1),2),((5,2),3),((3,3),5),((1,4),4),((4,5),4)]).

boardTest(B,3):-
    createBoard(B,2),
    addNumberedCells(B,[((1,1),1),((2,2),1)]).

boardTest(B,4):-
    createBoard(B,3),
    addNumberedCells(B,[((1,1),2),((2,3),3),((3,2),1)]).

boardTest(B,5):-
    createBoard(B,4),
    addNumberedCells(B,[((3,2),1),((2,3),3),((4,3),2),((1,4),6)]).

boardTest(B,6):-
    createBoard(B,5),
    addNumberedCells(B,[((2,1),3),((5,1),2),((1,2),3),((3,2),3),((4,3),3),((5,4),1),((3,5),1),((2,4),1)]).

test(N):-
    boardTest(B,N),
    convertBoard(B,Board),
    getSolution(Board, Result),
    getNumbersList(B,List),
    displayBoard(B),
    reverseBoard(Result,List,FinalBoard),
    displayBoard(FinalBoard).