replacefirst(_,_,[],[]).
replacefirst(X,Y,[X|L],[Y|L]):-!.
replacefirst(X,Y,[B|L],[B|L1]):-
	replacefirst(X,Y,L,L1).