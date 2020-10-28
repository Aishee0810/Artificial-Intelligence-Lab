tower(1,S,D,_,1):-
	write("Move Disk 1 from "),
	write(S),
	write(" to "),
	write(D),
	write("."),
	nl,
	!.
tower(N,S,D,A,X):-
	N>1,
	N1 is N-1,
	tower(N1,S,A,D,X1),
	write("Move Disk "),
	write(N),
	write(" from "),
	write(S),
	write(" to "),
	write(D),
	write("."),
	nl,
	tower(N1,A,D,S,X2),
	X is X1+X2+1.
hanoi(N,Moves):-
	tower(N,'Left','Centre','Right',Moves).