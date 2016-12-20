/* -*- Mode:Prolog; coding:iso-8859-1; indent-tabs-mode:nil; prolog-indent-width:8; prolog-paren-indent:3; tab-width:8; -*- */

test:-
    createBoard(B,12),
    addNumberedCells(B,[((5,1),10),((1,2),2),((7,2),5),((3,3),6),((11,3),7),((12,4),12),((4,5),9),((11,5),1),((9,6),7),((2,7),4),((8,7),8),((1,8),9),((5,8),1),((11,8),4),((2,9),5),((7,10),6),((10,10),1),((3,11),8),((12,11),6),((9,12),13)]),
    displayBoard(B).