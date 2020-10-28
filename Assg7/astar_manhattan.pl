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

%		astar_manh([2,8,3,1,6,4,7,0,5],[1,2,3,8,0,4,7,6,5]).

astar_manh(S,G) :-
		astar_manh_acc(G,[S],APath,[[S]],Path1,N),
		len(Path1,Len),
		PLength is Len - 1,
		reverse(Path1,Path),
		locate(Path,Moves),
		nl,write("Path length --> "),write(PLength),nl,
		nl,write("Path:"),nl,
		display2(Path,Moves),
		write("Goal State Reached!"),
		nl,nl,!.
		
astar_manh_acc(G,APath,APath,PList,[G|MinPath],N) :- 
		min_cost(PList,G,[G|MinPath]),!,
		len(APath,N),
		nl,write("A* Algorithm using Manhattan Distance Heuristic:"),nl,
		nl,write("Number of nodes searched --> "),write(N),nl,
		nl,display1(APath).
astar_manh_acc(G,Check,APath,PList,Path,N):-
		min_cost(PList,G,[MP|MinPath]),
		first_occurrence([MP|MinPath],PList,PList1),
		findall(S1,(move(MP,S1,M1), not(member(S1,[MP|MinPath]))),Children),        % generate children for adding to queue
		appendpath([MP|MinPath],PList1,Children,[],PList2),
		append(Check,Children,Check1),
		astar_manh_acc(G,Check1,Apath,PList2,Path,N).

col(Index,3) :- 
		Index1 is Index mod 3,
		Index1 == 0,!.
col(Index,Col) :-
		Col is Index mod 3.
	
row(Index,Index2) :- 
		Index1 is Index mod 3,
		Index1 == 0,
		Index2 is Index // 3,!.
row(Index,Index2) :-
		Index1 is Index // 3,
		Index2 is Index1 + 1.
		
get_index(H,[H|_],1) :- !.
get_index(H,[_|T],Ind) :-
		get_index(H,T,Ind1),
		Ind is Ind1 + 1.

manh_dist_ind(HN,N,Goal,D) :-
		get_index(HN,N,IndN),
		get_index(HN,Goal,IndG),
		row(IndN,RowN),
		col(IndN,ColN),
		row(IndG,RowG),
		col(IndG,ColG),
		D is abs(RowN-RowG) + abs(ColN-ColG).

manh_dist([],_,_,0) :- !.
manh_dist([HN|NRest],N,Goal,D) :- 
		HN =\= 0,!,
		manh_dist_ind(HN,N,Goal,D1),
		manh_dist(NRest,N,Goal,D2),
		D is D1+D2.
manh_dist([HN|NRest],N,Goal,D) :-
		manh_dist(NRest,N,Goal,D).

cost([A|APath],Goal,F) :-
	manh_dist(A,A,Goal,H),
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
		
first_occurrence(_,[],[]) :- !.
first_occurrence(X, [X|L], L) :- !.
first_occurrence(X, [Y|L], [Y|M]) :-
        first_occurrence(X, L, M).

display1([]).
display1([X|L]):-
        write(X),nl,
		display1(L).
		
display2([X],[]) :- write(X),nl.
display2([X|L],[M|Moves]) :-
		write(X),write(" "),write(M),nl,
		display2(L,Moves).	