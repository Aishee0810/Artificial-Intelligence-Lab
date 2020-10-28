sublist([],_):-!.
sublist([X|L],[X|M]):- prefix(L,M).
sublist(L,[X|M]):- sublist(L,M).
prefix([],_):-!.
prefix([X|L],[X|M]):-prefix(L,M).