add(A,[],A).
add(A,L,L):- member(A,L),!.
add(A,L,[A|L]).