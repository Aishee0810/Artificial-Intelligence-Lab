grt100([],0).
grt100([H|T],Count):-
	H>100,
	grt100(T,CountRest),
	Count is CountRest+1.
grt100([H|T],Count):-
	H=<100,
	grt100(T,Count).