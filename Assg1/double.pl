double2([],[]).
double2([H|T1],[H|[H|T2]]):-
	double2(T1,T2).