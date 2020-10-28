interval(X,X,[X]):- !.
interval(X,Y,[X|Rest]):-
	X=<Y,
	Z is X+1,
	interval(Z,Y,Rest).