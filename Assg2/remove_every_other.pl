remove_every_other([X],[X]):-!.
remove_every_other([],[]):-!.
remove_every_other([X|[Y|L]],[X|L1]):-
	remove_every_other(L,L1).