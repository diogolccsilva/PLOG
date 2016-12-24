
getSolution(Board, Solution) :-
	length(Board, N),
	startNumberCells(Board, Detailed),
	
	length(Detailed, CellDomain),
	CellRegion #= CellDomain - 1,
	startEmptyBoard(N, CellRegion, EBoard),

	statistics(walltime, _),

	startCellArea(EBoard, Detailed, Result),
	restricts(Board,Result,Detailed,CellDomain),
	append(Result, ListSolution),
	
	labeling([step], ListSolution),


	statistics(walltime, [_, Elapsed | _]),
	format('Time taken to find solution: ~3d seconds', Elapsed), nl,
	fd_statistics,

	list_to_matrix(ListSolution, N, Solution).
