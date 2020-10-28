quick_sort([],[]):-!.
quick_sort([H|T],L1):-
	partition(T,Lt,H,Gt),
	quick_sort(Gt,GtSorted),
	quick_sort(Lt,LtSorted),
	append(LtSorted,[H|GtSorted],L1).

partition([],[],_,[]):-!.
partition([X|R],[X|TLt],H,Gt):-
	X=<H,!,
	partition(R,TLt,H,Gt).
partition([X|R],Lt,H,[X|TGt]):-
	X>H,
	partition(R,Lt,H,TGt).

append([],L,L):-!.
append([X|L1],L2,[X|L3]):-
	append(L1,L2,L3).