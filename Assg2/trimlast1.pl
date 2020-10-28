tlast(0,L,L):-!.
tlast(N,[X|L1],[X|L2]):-
	N1 is N-1,
	tlast(N1,L1,L2).