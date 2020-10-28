factorial(0,1).
factorial(N,Fact):-
	N>0,
	N1 is N-1,
	factorial(N1,Fact1),
	Fact is N*Fact1.