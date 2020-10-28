:-[database].
:-[length].
poem(0):-!.
poem(N):-
	line1(),nl,
	line2(),nl,
	line3(),nl,
	line4(),nl,
	nl,
	N1 is N-1,
	poem(N1).
line1():-
	match('a',L),
	select(X,L),
	write(X),
	write(" "),
	match('b',L1),
	select(X1,L1),
	write(X1),
	write(" "),
	select(X2,L1),
	write(X2),
	write(" "),
	match('c',L3),
	select(X3,L3),
	write(X3).
line2():-
	match('d',M1),
	select(Y1,M1),
	write(Y1),
	write(" "),
	match('e',M2),
	select(Y2,M2),
	write(Y2),
	write(" "),
	select(Y3,M2),
	write(Y3),
	write(" "),
	match('c',M3),
	select(Y4,M3),
	write(Y4).
line3():-
	match('f',P1),
	select(Z1,P1),
	write(Z1),
	write(" "),
	select(Z2,P1),
	write(Z2),
	write(" "),
	match('g',P2),
	select(Z3,P2),
	write(Z3).	
line4():-
	match('h',Q1),
	select(A1,Q1),
	write(A1),
	write(" "),
	match('i',Q2),
	select(A2,Q2),
	write(A2),
	write(" "),
	select(A3,Q2),
	write(A3),
	write(" "),
	match('c',Q3),
	select(A4,Q3),
	write(A4).
select([],[]).
select(X,L):-
	len(L,B),
	random(0,B,Index),
	nth0(Index,L,X).

