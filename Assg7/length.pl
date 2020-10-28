len([],0).
len([H|T],X):-
	len(T,Length),
	X is Length+1.