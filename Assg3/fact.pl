fact(N,X):-
	factacc(N,1,X).
factacc(0,A,A):-!.
factacc(N,A,X):-
	N>0,
	N1 is N-1,
	A1 is N*A,
	factacc(N1,A1,X).