max(X,Y,X):- X>=Y.
max(X,Y,Y):- X =< Y.
maxlist([X],X).
maxlist([X|Rest],Max):- maxlist(Rest,MaxRest),max(X,MaxRest,Max).