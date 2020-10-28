length1([],0):-!.
length1([H|T],X):-
	length1(T,Length),
	X is Length +1.