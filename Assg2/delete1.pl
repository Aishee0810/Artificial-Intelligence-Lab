deletefirst(_,[],[]).
deletefirst(A,[A|L],L):- !.
deletefirst(A,[B|L],[B|M]):- 
	deletefirst(A,L,M).