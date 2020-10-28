:-[deln].
:-[length1].
middleeven(L1,L2):-
	length1(L1,N),
	N1 is (N/2)+1,
	N2 is N/2,
	deln(N1,L1,L3),
	deln(N2,L3,L2).