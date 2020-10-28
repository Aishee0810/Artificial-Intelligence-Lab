:-[member].
remove([],[]).
remove([H|T],L):-
	member(H,T),
	!,
	remove(T,L).
remove([H|T],[H|L]):-
	remove(T,L).