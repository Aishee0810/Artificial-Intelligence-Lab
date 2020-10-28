:-[member1].
has_dupl([H|T]):-
	member(H,T),!.
has_dupl([H|T]):-
	has_dupl(T).