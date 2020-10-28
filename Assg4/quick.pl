quicksort(L,L1):-quickacc(L,[],L1).

quickacc([],A,A):-!.
quickacc([H|T],A,L1):-
	partition(T,Lt,H,Gt),
	quickacc(Gt,A,GtSorted),
	quickacc(Lt,[H|GtSorted],L1).

partition([],[],_,[]):-!.
partition([X|R],[X|TLt],H,Gt):-
	X=<H,!,
	partition(R,TLt,H,Gt).
partition([X|R],Lt,H,[X|TGt]):-
	X>H,
	partition(R,Lt,H,TGt).