delete(_,[],[]).
delete(A,[A|L],M):- 
	!,
	delete(A,L,M).
delete(A,[B|L],[B|M]):- 
	delete(A,L,M).