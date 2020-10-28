length1([],0).
length1([H|T],X):-
	length1(T,Length),
	X is Length+1.


sumlist([],0).
sumlist([X|Rest],Sum):-
	sumlist(Rest,SumRest),
	Sum is X+SumRest.


average(L,X):-
	sumlist(L,Sum),
	length1(L,L1),
	X is Sum/L1.