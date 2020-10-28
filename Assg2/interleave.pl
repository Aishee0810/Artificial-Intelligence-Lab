interleave([],X,X):-!.
interleave(X,[],X):-!.
interleave([X|L1],[Y|L2],[X|[Y|L3]]):-
	interleave(L1,L2,L3).