:-[length1].
:-[reverse1].
:-[trim].
:-[trimlast].
unfold([],[]):-!.
unfold([X],[X]):-!.
unfold(L,L1):-
	length1(L,N),
	N1 is (N+1)/2,
	trim(N1,L,L2),
	N2 is (N-1)/2,
	trimlast(N2,L,L3),
	append(L4,[X],L3),
	reverse(L4,L5),
	append(L5,[X],L6),
	reverse(L2,L7),
	append(L6,L7,L1).