:-[append].
rev(L,M):-revacc(L,[],M).
revacc([],A,A):-!.
revacc([H|T],A,M):-
	append([H],A,A1),
	revacc(T,A1,M).