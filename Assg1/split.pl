split([],[],[]).
split([H|T],[H|L1],L2):-
	H>=0,
	split(T,L1,L2).
split([H|T],L1,[H|L2]):-
	H<0,
	split(T,L1,L2).