selection_sort([],[]):-!.
selection_sort(L,[H|T]):-
	least(H,L,R),           %H contains min element and R contains rest of L
	selection_sort(R,T).
least(_,[],[]).
least(X,L,R):-
	select(X,L,R),       % X is the selected element of L
	smaller(X,R).
smaller(_,[]):-!.
smaller(X,[H|T]):-
	X=< H,
	smaller(X,T).
select(X,[X|L],L).
select(X,[H|T],[H|T1]):-
	select(X,T,T1).