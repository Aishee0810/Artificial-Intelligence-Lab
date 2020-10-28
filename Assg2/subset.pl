subset([],_):-!.
subset([H|T],L):-
	member(H,L),
	subset(T,L).