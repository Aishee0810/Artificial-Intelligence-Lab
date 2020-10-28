:-[append4].
:-[length4].
heap_sort(L,Sorted):-
	len(L,Length),
	N is floor(Length/2),
	heap(L,Length,N,L1),
	last_heap(L1,Length,Sorted).

heap(L,N,0,L):-!.
heap(L,N,N1,M):-
	heapify(L,N,N1,L1),
	N2 is N1-1,
	heap(L1,N,N2,M).

last_heap(L,0,L):-!.
last_heap(L,N,M):-
	swap(L,1,N,L1),
	append(L2,[X],L1),
	N1 is N-1,
	heapify(L2,N1,1,L3),
	last_heap(L3,N1,L4),
	append(L4,[X],M).

heapify(L,N,N1,L1):-
	Max is N1,
	Left is (2*N1),
	Right is (2*N1+1),
	left(L,Left,N,Max,NextMax),
	right(L,Right,N,NextMax,NextMax1),
	root(L,N,N1,NextMax1,L1).

left(L,Left,N,Max,Left):-
	Left=<N,
	nth1(Left,L,X),
	nth1(Max,L,Y),
	X>Y,!.
left(L,Left,N,Max,Max).

right(L,Right,N,Max,Right):-
	Right=<N,
	nth1(Right,L,P),
	nth1(Max,L,Q),
	P>Q,!.
right(L,Right,N,Max,Max).

root(L,N,N1,Max,L2):-
	Max=\=N1,
	swap(L,N1,Max,L1),
	heapify(L1,N,Max,L2),!.
root(L,N,N1,Max,L).

swap(L,X,Y,L1):-
	nth1(X,L,M),
	nth1(Y,L,N),
	replacen(X,N,L,L2),
	replacen(Y,M,L2,L1).

replacen(N,M,[],[]):-!.
replacen(1,M,[X|L],[M|L]):-!.
replacen(N,M,[X|L1],[X|L2]):-
	N1 is N-1,
	replacen(N1,M,L1,L2).
	