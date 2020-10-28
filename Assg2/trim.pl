trim(0,L,L):-!.
trim(N,[X|L1],L2):-
	N1 is N-1,
	trim(N1,L1,L2).