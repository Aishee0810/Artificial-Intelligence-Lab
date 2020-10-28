:-[append].
:-[revacc].
:-[ind_U].
:-[repl_n].


less(L,X,N) :-
        less_acc(L,X,1,N).
less_acc([X|[Y|L]],Y,A,A1) :-
        Y < X, A1 is A+1, !.
less_acc([X|[Y|L]],Z,A,N) :-
        A1 is A+1,
        less_acc([Y|L],Z,A1,N).

split(L,1,[],L) :- !.
split([H|L],N,[H|L1],L2) :-
        N1 is N-1,
        split(L,N1,L1,L2).


next_high(L,L1):-
	rev(L,L2),
	less(L2,X,N1),
	split(L2,N1,L3,L4),
	min_ind(L3,X,Y,N2),
	replacen(N2,X,L2,L5),
	replacen(N1,Y,L5,L6),
	split(L6,N1,L7,L8),
	rev(L8,L9),
	append(L9,L7,L1).
