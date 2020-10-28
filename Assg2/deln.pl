deln(N,[],[]).
deln(1,[X|L],L):-!.
deln(N,[X|L1],[X|L2]):-
	N1 is N-1,
	deln(N1,L1,L2).
	