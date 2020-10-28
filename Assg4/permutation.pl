permutation_sort([],[]):-!.
permutation_sort(L,L1):-
	permutation(L,L1),
	ordered(L1),!.

permutation([],[]).
permutation(L,[H|T]):-
	select(H,L,R),
	permutation(R,T).

select(X,[X|L],L).
select(X,[H|T],[H|T1]):-
	select(X,T,T1).

ordered([]).
ordered([X]).
ordered([X|[Y|Rest]]):-
	X=<Y,
	ordered([Y|Rest]).
