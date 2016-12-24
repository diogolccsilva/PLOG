/* -*- Mode:Prolog; coding:iso-8859-1; indent-tabs-mode:nil; prolog-indent-width:8; prolog-paren-indent:3; tab-width:8; -*- */


boardTest(B,12):-
    createBoard(B,12),
    addNumberedCells(B,[((5,1),10),((1,2),2),((7,2),5),((3,3),6),((11,3),7),((12,4),12),((4,5),9),((11,5),1),((9,6),7),((2,7),4),((8,7),8),((1,8),9),((5,8),1),((11,8),4),((2,9),5),((7,10),6),((10,10),1),((3,11),8),((12,11),6),((9,12),13)]).

boardTest(B,2):-
    createBoard(B,2),
    addNumberedCells(B,[((1,1),1),((2,2),1)]).

boardTest(B,3):-
    createBoard(B,3),
    addNumberedCells(B,[((1,1),2),((2,3),3),((3,2),1)]).

boardTest(B,4):-
    createBoard(B,4),
    addNumberedCells(B,[((3,2),1),((2,3),3),((4,3),2),((1,4),6)]).

boardTest(B,5):-
    createBoard(B,5),
    addNumberedCells(B,[((2,1),3),((5,1),2),((1,2),3),((3,2),3),((4,3),3),((5,4),1),((3,5),1),((2,4),1)]).

boardTest(B,6):-
    createBoard(B,6),
    addNumberedCells(B,[((1,1),1),((5,1),2),((3,2),4),((6,2),1),((2,3),2),((5,4),1),((1,5),2),((4,5),5),((2,6),3),((6,6),5)]).

boardTest(B,8):-
    createBoard(B,8),
    addNumberedCells(B,[((3,1),3),((8,1),3),((2,2),3),((4,2),1),((7,2),3),((1,3),4),((4,3),3),((2,4),1),((3,4),2),((6,5),5),((7,5),1),((5,6),6),((8,6),2),((2,7),2),((5,7),1),((7,7),2),((1,8),3),((6,8),1)]).

boardTest(B,10):-
    createBoard(B,10),
    addNumberedCells(B,[((4,1),9),((2,2),1),((6,2),2),((9,2),1),((4,3),1),((5,3),2),((7,3),2),((1,4),9),((3,4),3),((8,4),3),((3,5),1),((5,5),4),((9,5),3),((2,6),5),((6,6),1),((8,6),1),((3,7),5),((8,7),2),((10,7),6),((4,8),2),((6,8),2),((7,8),1),((2,9),2),((5,9),1),((9,9),2),((7,10),3)]).

test(N):-
    boardTest(B,N),
    convertBoard(B,Board),
    getSolution(Board, Result),
    getNumbersList(B,List),
    displayBoard(B),
    reverseBoard(Result,List,FinalBoard),
    displayBoard(FinalBoard).