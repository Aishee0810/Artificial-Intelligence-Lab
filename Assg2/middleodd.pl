:-[deln].
:-[length1].
middleodd(L1,L2):-
	length1(L1,N),
	N1 is (N+1)/2,
	deln(N1,L1,L2).