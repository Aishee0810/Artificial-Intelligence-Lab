insertion_sort([],[]):-!.
insertion_sort([H|T],L):-
	insertion_sort(T,L1),
	insert(H,L1,L).

insert(X,[],[X]):-!.
insert(X,[H|T],[X|[H|T]]):-
	X=<H.
insert(X,[H|T],[H|T1]):-
	X>H,
	insert(X,T,T1).
