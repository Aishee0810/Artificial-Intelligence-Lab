visited(X,[X|_]) :- !.
visited(X,[_|Rest]) :-
    visited(X,Rest).

invalid((M, T, T, C)) :-M=\=T.
invalid((M,T,G,G)):- M=\=G.


move((1,1,1,1),L,P):-!,nl,output(P).

move((M, T, G, C),L,P) :-
	M1 is 1 - M,
	not(invalid((M1, T, G, C))),
	not(visited((M1, T, G, C),L)),
	add(["Farmer",crosses,:,"(",M, T, G, C,")","-->","(",M1, T, G, C,")"],P,P1),
	add((M1,T,G,C),L,L1),
	move((M1, T, G, C),L1,P1).

move((M, M, G, C),L,P) :-
	M1 is 1 - M,
	not(invalid((M1, M1, G, C))),
	not(visited((M1, M1, G, C),L)),
	add(["Farmer",and,"Tiger",cross,:,"(",M, M, G, C,")","-->","(",M1, M1, G, C,")"],P,P1),
	add((M1,M1,G,C),L,L1),
	move((M1, M1, G, C),L1,P1).

move((M, T, M, C),L,P) :-
	M1 is 1 - M,
	not(invalid((M1, T, M1, C))),
	not(visited((M1, T, M1, C),L)),
	add(["Farmer",and,"Goat",cross,:,"(",M, T, M, C,")","-->","(",M1, T, M1, C,")"],P,P1),
	add((M1,T,M1,C),L,L1),
	move((M1, T, M1, C),L1,P1).

move((M, T, G, M),L,P) :-
	M1 is 1 - M,
	not(invalid((M1, T, G, M1))),
	not(visited((M1, T, G, M1),L)),
	add(["Farmer",and,"Cabbage",cross,:,"(",M, T, G, M,")","-->","(",M1, T, G, M1,")"],P,P1),
	add((M1,T,G,M1),L,L1),
	move((M1, T, G, M1),L1,P1).


start :-
	write("\nRepresentation of State : (Farmer Tiger Goat Cabbage)\n"),
	write("0 : Left Bank\n"),
	write("1 : Right Bank\n\n"),
	move((0,0,0,0),[(0,0,0,0)],[["All on Left Bank",:,"(",0,0,0,0,")"]]).

output([]):-!.
output([X|L]):-
	print(X),nl,
	output(L).

print([X]) :- write(X),!.
print([X|L]) :-
    write(X),write(" "),
	print(L).
add(X,L,L1):-
    append(L,[X],L1).

append([],L,L):-!.
append([X|L1],L2,[X|L3]):-
    append(L1,L2,L3).