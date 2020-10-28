in(X,bt(nil,X,nil)):-!.
in(X,bt(Left,X,Right)):-!.
in(X,bt(Left,Root,Right)):-
	in(X,Left),!
	;
	in(X,Right).