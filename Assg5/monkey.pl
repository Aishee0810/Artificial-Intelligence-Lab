member(X,[X|_]):-!.
member(X,[H|T]):-member(X,T).

check(P1,at_door).
check(P1,middle).
check(P1,at_window).

move(state(middle, on_box, middle, has_not),
		grasp,
		state(middle, on_box, middle, has),L,L1):-
	append(L,[(middle, on_box, middle, has)],L1).
move(state(P, on_floor, P, H),
		climb,
		state(P, on_box, P, H),L,L1):-
	append(L,[(P, on_box, P, H)],L1).
move(state(P1, on_floor, P1, H),
		push(P1, P2),
		state(P2, on_floor, P2, H),L,L1):-
	check(P1,P2),
	not(member((P2, on_floor, P2, H),L)),
	append(L,[(P2, on_floor, P2,H)],L1).
move(state(P1, on_floor, P, H),
	walk(P1, P2),
	state(P2, on_floor, P, H),L,L1):-
	check(P1,P2),
	not(member((P2, on_floor, P, H),L)),
	append(L,[(P2, on_floor, P, H)],L1).
canget(state(_, _, _, has),[],L):-!.
	canget(OldState,[Move|Rest],L) :-
			move(OldState, Move, NewState,L,L1),
			canget(NewState,Rest,L1).



