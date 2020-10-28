is_bst(nil):-!.
is_bst(t(Left,Root,Right)):-
	is_bst(Left),
	is_bst(Right),
	is_less(Root,Right),
	is_high(Root,Left).


is_less(_,nil):-!.
is_less(N,t(L,M,R)):-
	N<M,
	is_less(N,L),
	is_less(N,R).

is_high(_,nil):-!.
is_high(N,t(L,M,R)):-
	N>=M,
	is_high(N,L),
	is_high(N,R).