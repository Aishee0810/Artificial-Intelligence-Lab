:-[reverse1].
:-[circular_left].
circular_right(L,L1):-
	reverse(L,M),
	circular_left(M,X),
	reverse(X,L1).