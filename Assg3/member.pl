member(X,[X|_]).
member(X,[_|Rest]):-
	member(X,Rest).