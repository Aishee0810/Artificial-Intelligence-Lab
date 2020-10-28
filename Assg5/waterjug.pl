state(2,_,L,P).

state(X,Y,L,P):- X < 4,
    not(visited_state(4,Y),L),
    add((4,Y),L,L1),            
    write('Fill the 4-Gallon Jug: '), write(X), 
    write(' '), write(Y), write(' --> '), write('4'), 
    write(' '), writeln(Y),
    state(4,Y).

state(X,Y):- Y < 3,
    not(visited_state(X,3)),
    assert(visited_state(X,Y)),
    write('Fill the 3-Gallon Jug: '), write(X), 
    write(' '), write(Y), write(' --> '), write(X), 
    write(' '), writeln('3'),
    state(X,3).

state(X,Y):- X > 0,
    not(visited_state(0,Y)),
    assert(visited_state(X,Y)),
    write('Empty the 4-Gallon jug on ground: '), write(X), 
    write(' '), write(Y), write(' --> '), write('0'), 
    write(' '), writeln(Y),
    state(0,Y).

state(X,Y):- Y > 0,
    not(visited_state(X,0)),
    assert(visited_state(X,Y)),
    write('Empty the 3-Gallon jug on ground: '), write(X), write(' '), write(Y), write(' --> '), write(X), write(' '), writeln('0'),
    state(X,0).

state(X,Y):- X + Y >= 4,
    Y > 0,
    NEW_Y is Y - (4 - X),
    not(visited_state(4,NEW_Y)),
    assert(visited_state(X,Y)),
    write('Pour water from 3-Gallon jug to 4-gallon until it is full: '), write(X), write(' '), write(Y), write(' --> '), write('4'), write(' '), writeln(NEW_Y),
    state(4,NEW_Y).

state(X,Y):- X + Y >=3,
    X > 0,
    NEW_X is X - (3 - Y),
    not(visited_state(X,3)),
    assert(visited_state(X,Y)),
    write('Pour water from 4-Gallon jug to 3-gallon until it is full: '), write(X), write(' '), write(Y), write(' --> '), write(NEW_X), write(' '), writeln('3'),
    state(NEW_X,3).

state(X,Y):- X + Y =< 4,
    Y > 0,
    NEW_X is X + Y,
    not(visited_state(NEW_X,0)),
    assert(visited_state(X,Y)),
    write('Pour all the water from 3-Gallon jug to 4-gallon: '),
     write(X), write(' '), write(Y), write(' --> '), write(NEW_X),
     write(' '), writeln('0'),
    state(NEW_X,0).

state(X,Y):- X+Y=<3,
    X > 0,
    NEW_Y is X + Y,
    not(visited_state(0,NEW_Y)),
    assert(visited_state(X,Y)),
    write('Pour all the water from 4-Gallon jug to 3-gallon: '), 
    write(X), write(' '), write(Y), write(' --> '), write('0'),
     write(' '), writeln(NEW_Y),
    state(0,NEW_Y).

state(0,2):- not(visited_state(2,0)),
    assert(visited_state(0,2)),
    write('Pour 2 gallons from 3-Gallon jug to 4-gallon: '), 
    write(X), write(' '), write(Y), write(' --> '), write('2'), 
    write(' '), writeln('0'),
    state(2,0).

state(2,Y):- not(visited_state(0,Y)),
    assert(visited_state(2,Y)),
    write('Empty 2 gallons from 4-Gallon jug on the ground: '), 
    write(X), write(' '), write(Y), write(' --> '), write(NEW_X), 
    rite(' '), writeln('0'),
    state(0,Y).

water_jug:-state(0,0).