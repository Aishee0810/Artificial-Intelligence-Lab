mem_bst(X,bst(_,X,_)):-!.
mem_bst(X,bst(Left,Root,_)):- X<Root,mem_bst(X,Left).
mem_bst(X,bst(_,Root,Right)):-
	X>Root,
	mem_bst(X,Right).