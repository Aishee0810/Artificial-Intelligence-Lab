reverse([],[]):-!.
reverse([H|T],L):- reverse(T,Z), append(Z,[H],L).