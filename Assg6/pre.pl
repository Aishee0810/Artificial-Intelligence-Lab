preorder(nil,[]):-!.
preorder(t(Left,Root,Right),[Root|L]):-
	preorder(Left,Lt),
	append(Lt,Rt,L),
	preorder(Right,Rt).