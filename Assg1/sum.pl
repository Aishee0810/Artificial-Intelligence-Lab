sumlist([],0).
sumlist([X|Rest],Sum):-
	sumlist(Rest,SumRest),
	Sum is X+SumRest.