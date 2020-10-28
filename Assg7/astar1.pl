:-[member].
:-[reverse].
:-[length].

% up from middle
move([A1,A2,A3, 0,A5,A6, A7,A8,A9], [0,A2,A3, A1,A5,A6, A7,A8,A9], "Move upwards from middle row.").
move([A1,A2,A3, A4,0,A6, A7,A8,A9], [A1,0,A3, A4,A2,A6, A7,A8,A9], "Move upwards from middle row.").
move([A1,A2,A3, A4,A5,0, A7,A8,A9], [A1,A2,0, A4,A5,A3, A7,A8,A9], "Move upwards from middle row.").

% up from bottom
move([A1,A2,A3, A4,A5,A6, A7,0,A9], [A1,A2,A3, A4,0,A6, A7,A5,A9], "Move upwards from bottom row.").
move([A1,A2,A3, A4,A5,A6, A7,A8,0], [A1,A2,A3, A4,A5,0, A7,A8,A6], "Move upwards from bottom row.").
move([A1,A2,A3, A4,A5,A6, 0,A8,A9], [A1,A2,A3, 0,A5,A6, A4,A8,A9], "Move upwards from bottom row.").

% down from top
move([0,A2,A3, A4,A5,A6, A7,A8,A9], [A4,A2,A3, 0,A5,A6, A7,A8,A9], "Move downwards from top row.").
move([A1,0,A3, A4,A5,A6, A7,A8,A9], [A1,A5,A3, A4,0,A6, A7,A8,A9], "Move downwards from top row.").
move([A1,A2,0, A4,A5,A6, A7,A8,A9], [A1,A2,A6, A4,A5,0, A7,A8,A9], "Move downwards from top row.").

% down from middle
move([A1,A2,A3, 0,A5,A6, A7,A8,A9], [A1,A2,A3, A7,A5,A6, 0,A8,A9], "Move downwards from middle row.").
move([A1,A2,A3, A4,0,A6, A7,A8,A9], [A1,A2,A3, A4,A8,A6, A7,0,A9], "Move downwards from middle row.").
move([A1,A2,A3, A4,A5,0, A7,A8,A9], [A1,A2,A3, A4,A5,A9, A7,A8,0], "Move downwards from middle row.").
	 
% left in top 
move([A1,0,A3, A4,A5,A6, A7,A8,A9], [0,A1,A3, A4,A5,A6, A7,A8,A9], "Move left in top row.").
move([A1,A2,0, A4,A5,A6, A7,A8,A9], [A1,0,A2, A4,A5,A6, A7,A8,A9], "Move left in top row.").

% left in middle
move([A1,A2,A3, A4,0,A6,A7,A8,A9], [A1,A2,A3, 0,A4,A6,A7,A8,A9], "Move left in middle row.").
move([A1,A2,A3, A4,A5,0,A7,A8,A9], [A1,A2,A3, A4,0,A5,A7,A8,A9], "Move left in middle row.").

% left in bottom
move([A1,A2,A3, A4,A5,A6, A7,0,A9], [A1,A2,A3, A4,A5,A6, 0,A7,A9], "Move left in bottom row.").
move([A1,A2,A3, A4,A5,A6, A7,A8,0], [A1,A2,A3, A4,A5,A6, A7,0,A8], "Move left in bottom row.").

% right in top
move([0,A2,A3, A4,A5,A6, A7,A8,A9], [A2,0,A3, A4,A5,A6, A7,A8,A9], "Move right in top row.").
move([A1,0,A3, A4,A5,A6, A7,A8,A9], [A1,A3,0, A4,A5,A6, A7,A8,A9], "Move right in top row.").

% right in middle
move([A1,A2,A3, 0,A5,A6, A7,A8,A9], [A1,A2,A3, A5,0,A6, A7,A8,A9], "Move right in middle row.").
move([A1,A2,A3, A4,0,A6, A7,A8,A9], [A1,A2,A3, A4,A6,0, A7,A8,A9], "Move right in middle row.").

% right in bottom
move([A1,A2,A3, A4,A5,A6,0,A8,A9], [A1,A2,A3, A4,A5,A6,A8,0,A9], "Move right in bottom row.").
move([A1,A2,A3, A4,A5,A6,A7,0,A9], [A1,A2,A3, A4,A5,A6,A7,A9,0], "Move right in bottom row.").

locate([L1,L2],[Moves]) :- move(L1,L2,Moves),!.
locate([L1|[L2|Rest]],[Moves|List]) :-
		move(L1,L2,Moves),
		locate([L2|Rest],List).

%		astar1([2,8,3,1,6,4,7,0,5],[1,2,3,8,0,4,7,6,5]).

astar1(S,G) :-
		astar1_acc(G,[S],APath,[[S]],Path1,N),
		len(Path1,Length),
		PLength is Length - 1,
		reverse(Path1,Path),
		locate(Path,Moves),
		nl,write("Length of Path -->  "),write(PLength),write("."),nl,
		nl,write("Path:"),nl,
		display2(Path,Moves),
		nl, write("Goal State Reached!"),
		nl,nl,!.
		
astar1_acc(G,APath,APath,PList,[G|MinPath],N) :- 
		min_cost(PList,G,[G|MinPath]),!,
		nl,write("A* Algorithm using Number of Tiles Mismatch Heuristic:"),nl,
		nl,len(APath,N),
		write("Number of nodes searched --> "),write(N),write("."),
		nl,nl,display1(APath),
		nl.
astar1_acc(G,CheckList,APath,PList,Path,N):-
		min_cost(PList,G,[MP|MinPath]),
		first_occurence([MP|MinPath],PList,PList1),
		findall(S1,(move(MP,S1,M1), not(member(S1,[MP|MinPath]))),Children),        % generate children for adding to queue
		appendpath([MP|MinPath],PList1,Children,[],PList2),
		append(CheckList,Children,CheckList1),
		astar1_acc(G,CheckList1,Apath,PList2,Path,N).
		

tile_mismatch([],[],0) :- !.
tile_mismatch([H|T],[H|Goal],L) :- 
		tile_mismatch(T,Goal,L),!.
tile_mismatch([HT|T],[HG|Goal],L) :-
		HT =\= 0,!,
		tile_mismatch(T,Goal,L1),
		L is L1 + 1.
tile_mismatch([HT|T],[HG|Goal],L) :-
		tile_mismatch(T,Goal,L).
		
cost([A|APath],Goal,F) :-
	tile_mismatch(A,Goal,H),
	len(APath,G),
	F is G + H.

min_cost([APath],_,APath) :- !.
min_cost([APath|APathList],Goal,APath) :-
		cost(APath,Goal,F),
		min_cost(APathList,Goal,APath1),
		cost(APath1,Goal,F1),
		F =< F1,!.
min_cost([_|APathList],Goal,APath) :- 
		min_cost(APathList,Goal,APath).	
		
		
appendpath(P,PList,[],CPath,PList1) :- append(PList,CPath,PList1),!.
appendpath(P,PList,[C|Children],CPath,PList1) :-
		append(CPath,[[C|P]],CPath1),
		appendpath(P,PList,Children,CPath1,PList1).
		
first_occurence(_,[],[]) :- !.
first_occurence(X, [X|L], L) :- !.
first_occurence(X, [Y|L], [Y|M]) :-
        first_occurence(X, L, M).

display1([]).
display1([X|L]):-
        write(X),nl,
		display1(L).
		
display2([X],[]) :- write(X),nl.
display2([X|L],[M|Moves]) :-
		write(X),write(" "),write(M),nl,
		display2(L,Moves).