band_ord(band(band_mem(N1,C1,I1),band_mem(N2,C2,I2),band_mem(N3,C3,I3))).
first(X,band(X,_,_)).
name(band_mem(N,_,_),N).
country(band_mem(_,C,_),C).
instrument(band_mem(_,_,I),I).

ord(X,Y,band(X,Y,Z)).
ord(X,Z,band(X,Y,Z)).
ord(Y,Z,band(X,Y,Z)).

mem(X,band(X,Y,Z)).
mem(Y,band(X,Y,Z)).
mem(Z,band(X,Y,Z)).

print(band(band_mem(N1,C1,I1),band_mem(N2,C2,I2),band_mem(N3,C3,I3))):-
	write("First -->"),write(N1),write(" "),write("from "),write(C1),write(" plays "),write(I1),write("."),nl,
	write("Second -->"),write(N2),write(" "),write("from "),write(C2),write(" plays "),write(I2),write("."),nl,
	write("Third -->"),write(N3),write(" "),write("from "),write(C3),write(" plays "),write(I3),write(".").

sequence():-
	band_ord(L),
	first(X,L),instrument(X,"Piano"),
	ord(Y,Z,L),
	name(Y,"John"),instrument(Y,"Saxophone"),
	country(Z,"Australia"),
	ord(A,B,L),
	name(A,"Mark"),country(A,"United States"),
	instrument(B,"Violin"),
	mem(U,L),country(U,"Japan"),
	mem(V,L),name(V,"Sam"),
	print(L).
