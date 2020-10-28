samelength([],[]):-!.
samelength([H1|L1],[H2|L2]):-
	samelength(L1,L2).
identical([],[]).
identical([H|T1],[H|T2]):-
	identical(T1,T2).
check_list(L1,L2):-
	samelength(L1,L2),
	write("Same Length."),nl,
	identical(L1,L2),
	write("Identical Lists."),nl,
	write(L1).
check_list(L1,L2):-
	samelength(L1,L2),
	not(identical(L1,L2)),nl,
	write("Not Identical Lists.").
check_list(L1,L2):-
	not(samelength(L1,L2)),
	write("Not Same Length.").
