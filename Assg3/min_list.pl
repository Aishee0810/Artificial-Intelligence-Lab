min(X,Y,X):- X=<Y.
min(X,Y,Y):- X >= Y.
minlist([X],X):-!.
minlist([X|Rest],Max):- minlist(Rest,MaxRest),min(X,MaxRest,Max).