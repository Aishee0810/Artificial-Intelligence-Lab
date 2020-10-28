:-[append].
circular_left([],[]):-!.
circular_left([X],[X]):-!.
circular_left([H|L],L1):-
	append(L,[H],L1).