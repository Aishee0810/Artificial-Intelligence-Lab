height(nil,0).
height(t(Left,Root,Right),H):-
	height(Left,L),
	height(Right,R),
	H is max(L,R)+1.

max(X,Y,X):-X>=Y,!.
max(X,Y,Y):- X<Y.