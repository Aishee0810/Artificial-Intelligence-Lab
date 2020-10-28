:-[reverse1].
:-[trim].
trimlast(N,L,L1):-
	reverse(L,M),
	trim(N,M,P),
	reverse(P,L1).