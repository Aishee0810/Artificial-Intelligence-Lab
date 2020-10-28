exchange([],[]):-!.
exchange([X],[X]):-!.
exchange(L1,L2):-
	append([H|Rest],[Last],L1),
	Sum is H+Last,
	append([Sum|Rest],[Sum],L2).
