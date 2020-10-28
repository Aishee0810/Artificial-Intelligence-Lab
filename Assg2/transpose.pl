transpose([],[],[]):-!.
transpose([X|L1],[Y|L2],[(X,Y)|L3]):-
	transpose(L1,L2,L3).