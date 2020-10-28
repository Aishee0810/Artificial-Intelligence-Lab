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

%		dfs([2,8,3,1,6,4,7,0,5],[1,2,3,8,0,4,7,6,5]).

dfs(S,G) :-
		nl,write("Depth First Search in Eight-Puzzle Problem:"),nl,
		nb_setval(c,0),
		dfs_acc(S,G,[S],Path1,0,[],Moves1),   
		nb_getval(c,N),
		write("Number of nodes searched --> "),write(N),nl,
		nb_setval(c,0),
		len(Path1,Length),
		PLength is Length - 1,
		reverse(Path1,Path),
		reverse(Moves1,Moves),
		nl,write("Path:"),nl,
		display(Path,Moves),
		nl,write("Goal State Reached!"),nl,
		nl,write("Length of Path --> "),write(PLength),nl,nl,!.
	
dfs_acc(G,G,Path,Path,Depth,M,M) :- 
		!,
		write(G),nl,
		nb_getval(c,N),
		N1 is N + 1,
		nb_setval(c,N1).
dfs_acc(S,G,CheckList,Path,Depth,M,Moves) :-
		write(S),nl,
		Depth < 8,      % depth
		move(S,S1,M1),
		not(member(S1,CheckList)),
		nb_getval(c,N),
		N1 is N + 1,
		nb_setval(c,N1),
		Depth1 is Depth + 1,
		dfs_acc(S1,G,[S1|CheckList],Path,Depth1,[M1|M],Moves).	

display([X],[]) :- write(X),nl.
display([X|L],[M|Moves]) :-
		write(X),write(" "),write(M),nl,
		display(L,Moves).