is_int(0).
is_int(s(X)):-
	is_int(X).

is_less(0,s(Y)):-!.
is_less(s(X),s(Y)):-
	is_less(X,Y).

is_greater(s(Z),0).
is_greater(s(X),s(Z)):-
	is_greater(X,Z).

is_less_equal(0,Y):-!.
is_less_equal(s(X),s(Y)):-
	is_less_equal(X,Y).

is_great_equal(Z,0):-!.
is_great_equal(s(X),s(Z)):-
	is_great_equal(X,s(Z)).

plus(0,Y,Y):-!.
plus(s(X),Y,s(Z)):-
	plus(X,Y,Z).

minus(X,0,X):-!.
minus(s(X),s(Y),Z):-
	minus(X,Y,Z).

multiply(0,Y,0):-!.
multiply(s(X),Y,P):-
	multiply(X,Y,Z),
	plus(Z,Y,P).

rem(0,Y,0):- 
	is_greater(Y,0),!.
rem(s(X),Y,0):-
	minus(Y,s(0),Z1),
	rem(X,Y,Z1),!.
rem(s(X),Y,s(Z)):-
	rem(X,Y,Z).

divide(0,Y,0):-
	is_greater(Y,0),!.
divide(s(X),Y,s(Z)):-
	minus(Y,s(0),Z1),
	rem(X,Y,Z1),
	divide(X,Y,Z),!.
divide(s(X),Y,Z):-
	divide(X,Y,Z).


squareroot(X,Ans):-sqacc(X,s(0),Ans).
sqacc(X,A,Ans):-
	multiply(A,A,Sq),
	is_less_equal(Sq,X),
	sqacc(X,s(A),Ans),!.
sqacc(X,s(A),A):-!.

div(0,Y,0):-
	is_greater(Y,0),!.
div(X,Y,Q):-divacc(X,Y,0,Q).
divacc(0,Y,A,A):-!.
divacc(X,Y,A,Q):-
	is_less(X,Y),!,
	divacc(0,Y,A,Q).
divacc(X,Y,A,Q):-
	minus(X,Y,N),
	divacc(N,Y,s(A),Q).