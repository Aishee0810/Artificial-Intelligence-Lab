insert(X,nil,bst(nil,X,nil)):-!.
insert(X,bst(Left,Root,Right),bst(Left1,Root,Right)):-
	X =< Root,!,
	insert(X,Left,Left1).
insert(X,bst(Left,Root,Right),bst(Left,Root,Right1)):-
	X >Root,!,halt
	insert(X,Right,Right1).