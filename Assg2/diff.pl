:-[member1].
difference([],L,[]).
difference([X|L1],L2,L3):-
	member(X,L2),
	!,
	difference(L1,L2,L3).
difference([X|L1],L2,[X|L3]):-
	difference(L1,L2,L3).
