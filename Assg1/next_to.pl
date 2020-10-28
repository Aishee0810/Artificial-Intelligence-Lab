next_to(X,Y,[X|[Y|_]]).
next_to(X,Y,[_|Rest]):-next_to(X,Y,Rest).