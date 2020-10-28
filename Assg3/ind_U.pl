:-[del_all].
:-[min_list].

min_val(L,X,Y):-
	min_list(L,Y),
	Y>X,!.
min_val(L,X,Y):-
	minlist(L,Y1),
	delete(Y1,L,M),
	min_val(M,X,Y).

first(L,X,N) :-
        first_acc(L,X,1,N).
first_acc([X|L],X,A,A) :- !.
first_acc([Y|L],X,A,N) :-
        A1 is A+1,
        first_acc(L,X,A1,N).

min_ind(L,X,Y,N) :-
        min_val(L,X,Y),!,
        first(L,Y,N).