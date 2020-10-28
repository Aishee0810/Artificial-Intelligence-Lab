fib(0,0):- !.
fib(1,1):- !.
fib(N,F):-
	N1 is N-1,
	N2 is N-2,
	fib(N1,F1),
	fib(N2,F2), 
	F is F1+F2.
fibonacci(0,[0]).
fibonacci(X,[F|Rest]):-
	X1 is X-1,
	fibonacci(X1,Rest),
	fib(X,F).
fib_seq(N,L):-
	fibonacci(N,L1),
	reverse(L1,L).