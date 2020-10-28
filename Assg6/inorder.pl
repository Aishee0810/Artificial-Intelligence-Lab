inorder(nil,[]):-!.
inorder(t(Left,Root,Right),L):-
	inorder(Left,Lt),
	inorder(Right,Rt),
	append(Lt,[Root|Rt],L).

append([],L,L):-!.
append([X|L1],L2,[X|L3]):-
	append(L1,L2,L3).