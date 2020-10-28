length([],0)..
length([H|T],X):-
	length(T,Length),
	X is Length+1.