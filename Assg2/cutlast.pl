cutlast([X],[]):-!.
cutlast([X|L],[X|L1]):-
	cutlast(L,L1).