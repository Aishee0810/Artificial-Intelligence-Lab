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

locate([P1,P2],[Move]) :- move(P1,P2,Move),!.
locate([P1|[P2|Rest]],[Move|Move_list]) :-
		move(P1,P2,Move),
		locate([P2|Rest],Move_list).


%		bfs([2,8,3,1,6,4,7,0,5],[1,2,3,8,0,4,7,6,5]).

bfs(S,G) :-
		bfs_acc(S,G,[],BPath1,[],[[S]],Path1),
		len(BPath1,N),
		reverse(BPath1,BPath),
		nl,write("Breadth First Search in Eight-Puzzle Problem:"),nl,
		display1(BPath),
		write("Number of nodes searched --> "),write(N),nl,
		len(Path1,Length),
		PLength is Length - 1,
		reverse(Path1,Path),
		locate(Path,Move),
		nl,write("Path:"),nl,
		display2(Path,Move),
		write("Goal State Reached!"),nl,
		write("Length of Path --> "),write(PLength),nl,nl,!.
		
bfs_acc(G,G,BPath,[G|BPath],Queue,[Path|_],Path) :-!.
bfs_acc(S,G,CheckList,BPath,Queue,[P|PList],Path):-
		not(member(S,CheckList)),!,
		findall(S1,move(S,S1,M1),Children),        % generate children for adding to queue
		append(Queue,Children,[First|Queue1]),
		appendpath(P,PList,Children,[],PList1),
		bfs_acc(First,G,[S|CheckList],BPath,Queue1,PList1,Path).
bfs_acc(S,G,CheckList,BPath,[First|Queue],[P|PList],Path):-
		bfs_acc(First,G,CheckList,BPath,Queue,PList,Path).
		
appendpath(P,PList,[],CPath,PList1) :- append(PList,CPath,PList1),!.
appendpath(P,PList,[C|Children],CPath,PList1) :-
		append(CPath,[[C|P]],CPath1),
		appendpath(P,PList,Children,CPath1,PList1).

display1([]).
display1([A|L]):-
        write(A),nl,
		display1(L).
		
display2([A],[]) :- write(A),nl.
display2([A|L],[M|Move]) :-
		write(A),write(" "),write(M),nl,
		display2(L,Move).