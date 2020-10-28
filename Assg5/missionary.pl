state((_,0,0,3,3),L) :- !, 
    write("Possible Solution:"),nl,
    write("Move           M/C : M/C "),
    nl,print(L).
	
state((left_to_right,ML,CL,MR,CR),L):-
    on_boat(BM,BC),
    ML1 is ML - BM, CL1 is CL - BC,
    MR1 is MR + BM, CR1 is CR + BC,
	legal(ML1,CL1,MR1,CR1),
    not(visited_state((right_to_left,ML1,CL1,MR1,CR1),L)),
    add((right_to_left,ML1,CL1,MR1,CR1),L,L1),
    state((right_to_left,ML1,CL1,MR1,CR1),L1).

state((right_to_left,ML,CL,MR,CR),L):-
    on_boat(BM,BC),
    ML1 is ML + BM, CL1 is CL + BC,
    MR1 is MR - BM, CR1 is CR - BC,
	legal(ML1,CL1,MR1,CR1),
    not(visited_state((left_to_right,ML1,CL1,MR1,CR1),L)),
    add((left_to_right,ML1,CL1,MR1,CR1),L,L1),
    state((left_to_right,ML1,CL1,MR1,CR1),L1).


on_boat(1,1).   %1 missionary, 1 cannibal
on_boat(0,1).   %1 cannibal
on_boat(1,0).   %1 missionary
on_boat(0,2).   %2 cannibals
on_boat(2,0).   %2 missionaries

missionary_cannibal():- state((left_to_right,3,3,0,0),[(left_to_right,3,3,0,0)]).
	
legal(ML,CL,MR,CR) :-
    TM is ML + MR, TC is CL + CR,
	TM == 3, TC == 3, ML >= 0, CL >= 0, MR >= 0, CR >= 0,
	(ML >= CL ; (ML = 0, CL =\= 0)),
	(MR >= CR ; (MR = 0, CR =\= 0)).

visited_state(X,[X|_]) :- !.
visited_state(X,[_|Rest]) :-
    visited_state(X,Rest).

add(X,L,[X|L]).		
	
print([(B,ML,CL,MR,CR)]) :- write("start"),write("          "),
    write(ML),write("/"),write(CL),write(" : "),write(MR),write("/"),write(CR),nl,!.
print([(B,ML,CL,MR,CR)|L]) :-
	print(L),
	opp(B,B1),
    write(B1),write("  "),write(ML),write("/"),
    write(CL),write(" : "),write(MR),write("/"),
    write(CR),nl.
	
opp(left_to_right,right_to_left).
opp(right_to_left,left_to_right).


	