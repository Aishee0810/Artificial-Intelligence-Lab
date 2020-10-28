:-[append].
exchange_first_last([],[]):-!.
exchange_first_last([X],[X]):-!.
exchange_first_last(L,L1):-
	append([H|Rest],[Last],L),
	append([Last|Rest],[H],L1).