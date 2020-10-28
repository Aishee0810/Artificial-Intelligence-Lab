first([],[]).
replace(0,_,L,L).
replace(1,X,[Y|L],[X|L]).
replace(N,X,[H|T],[X|L1]):-
	N1 is N-1,
	replace(N1,X,T,L1).
first(L,L1):-
	length(L,N),
	append([H],Rest,L),
	replace(N,H,L,L1).