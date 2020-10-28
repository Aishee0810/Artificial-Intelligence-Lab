replacen(N,M,[],[]):-!.
replacen(1,M,[X|L],[M|L]):-!.
replacen(N,M,[X|L1],[X|L2]):-
	N1 is N-1,
	replacen(N1,M,L1,L2).
	