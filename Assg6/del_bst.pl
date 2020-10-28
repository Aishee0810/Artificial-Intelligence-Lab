del_bst(t(nil,X,nil),X,nil).
del_bst(t(nil,X,Right),X,Right).
del_bst(t(Left,X,nil),X,Left).
del_bst(t(nil,X,Right),X,Right).
del_bst(t(Left,X,Right),X,t(Left,Y,Right1)):-
	del_min(Right,Y,Right1).
del_bst(t(Left,Root,Right),X,t(Left1,Root,Right)):-
	X<Root,!,
	del_bst(Left,X,Left1).
del_bst(t(Left,Root,Right),X,t(Left,Root,Right1)):-
	X<Root,
	del_bst(Right,X,Right1).

del_min(t(nil,Y,Right),Y,Right).
del_min(t(Left,Root,Right),Y,t(Left1,Root,Right)):-
	del_min(Left,Y,Left1).
