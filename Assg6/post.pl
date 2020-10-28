postorder(nil,[]):-!.
postorder(t(Left,Root,Right),L):-
	postorder(Left,Lt),
	append(Lt,Rt,L1),
	postorder(Right,Rt),
	append(L1,[Root],L).

append([],L,L):-!.
append([X|L1],L2,[X|L3]):-
	append(L1,L2,L3).