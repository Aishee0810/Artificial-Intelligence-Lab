replace(_,_,[],[]).
replace(X,Y,[X|L],[Y|L1]):-!,replace(X,Y,L,L1).
replace(X,Y,[B|L],[B|L1]):-
	replace(X,Y,L,L1).