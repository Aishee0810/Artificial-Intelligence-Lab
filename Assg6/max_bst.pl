maxbst(X,t(_,X,nil)):-!.
maxbst(X,t(_,Root,Right)):-
	maxbst(X,Right).