state(2,_,L,P) :- 
    !,printf(P),nl.

state(X,Y,L,P):- X < 4,
    not(visited_state((4,Y),L)),
    add((4,Y),L,L1),
	add(["Fill",4,litres,jug,:,"(",X,Y,")",>,>,"(",4,Y,")"],P,P1),
    state(4,Y,L1,P1).

state(X,Y,L,P):- Y < 3,
    not(visited_state((X,3),L)),
    add((X,3),L,L1),
	add(["Fill",3,litres,jug,:,"(",X,Y,")",>,>,"(",X,3,")"],P,P1),
    state(X,3,L1,P1).

state(X,Y,L,P):- X > 0,
    not(visited_state((0,Y),L)),
    add((0,Y),L,L1),
	add(["Empty",4,litres,jug,on,ground,:,"(",X,Y,")",>,>,"(",0,Y,")"],P,P1),
    state(0,Y,L1,P1).

state(X,Y,L,P):- Y > 0,
    not(visited_state((X,0),L)),
    add((X,0),L,L1),
	add(["Empty",3,litres,jug,on,ground,:,"(",X,Y,")",>,>,"(",X,0,")"],P,P1),
    state(X,0,L1,P1).

state(X,Y,L,P):- X + Y >= 4,
    Y > 0,
    NEW_Y is Y - (4 - X),
    not(visited_state((4,NEW_Y),L)),
    add((4,NEW_Y),L,L1),
	add(["Pour",water,from,3,litres,jug,to,4,litres,jug,till,full,:,"(",X,Y,")",>,>,"(",4,NEW_Y,")"],P,P1),
    state(4,NEW_Y,L1,P1).

state(X,Y,L,P):- X + Y >=3,
    X > 0,
    NEW_X is X - (3 - Y),
    not(visited_state((NEW_X,3),L)),
    add((NEW_X,3),L,L1),
	add(["Pour",water,from,4,litres,jug,to,3,litres,jug,till,full,:,"(",X,Y,")",>,>,"(",NEW_X,3,")"],P,P1),
    state(NEW_X,3,L1,P1).

state(X,Y,L,P):- X + Y =< 4,
    Y > 0,
    NEW_X is X + Y,
    not(visited_state((NEW_X,0),L)),
    add((NEW_X,0),L,L1),
	add(["Pour",all,water,from,3,litres,jug,to,4,litres,jug,:,"(",X,Y,")",>,>,"(",NEW_X,0,")"],P,P1),
    state(NEW_X,0,L1,P1).

state(X,Y,L,P):- X+Y=<3,
    X > 0,
    NEW_Y is X + Y,
    not(visited_state((0,NEW_Y),L)),
    add((0,NEW_Y),L,L1),
	add(["Pour",all,water,from,4,litres,jug,to,3,litres,jug,:,"(",X,Y,")",>,>,"(",0,NEW_Y,")"],P,P1),
    state(0,NEW_Y,L1,P1).

water_jug():- state(0,0,[(0,0)],[["Start",:,0,0]]).

visited_state(X,[X|_]) :- !.
visited_state(X,[_|Rest]) :-
    visited_state(X,Rest).

add(X,L,L1):-
    append(L,[X],L1).

append([],L,L):-!.
append([X|L1],L2,[X|L3]):-
    append(L1,L2,L3).
	

printf([]) :- !.
printf([X|L]) :-
    linear_print(X),nl,
	printf(L).
	
linear_print([X]) :- write(X),!.
linear_print([X|L]) :-
    write(X),write(" "),
	linear_print(L).