product([],[],[]):-!.
product([H1|T1],[H2|T2],[X|L]):-
	X is H1*H2,
	product(T1,T2,L).