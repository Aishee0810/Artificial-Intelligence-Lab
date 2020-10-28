bubble_sort([],[]):-!.
bubble_sort([X],[X]):-!.
bubble_sort(L,Sorted):-
	swap(L,L1),!,
	bubble_sort(L1,Sorted).
bubble_sort(Sorted,Sorted).

swap([X|[Y|R]],[Y|[X|R]]):-
	X>Y.
swap([X|R],[X|R1]):-
	swap(R,R1).
	