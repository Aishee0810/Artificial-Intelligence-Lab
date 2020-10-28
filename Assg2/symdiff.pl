:-[union].
:-[diff].
symdiff(L1,L2,L3):-
	difference(L1,L2,X),
	difference(L2,L1,Y),
	union(X,Y,L3).