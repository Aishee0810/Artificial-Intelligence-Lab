resolve([Cl1,Cl2],Resolvent):-
        select(X,Cl1,Resolvent1),
		check_negation(X,Y),
        select(Y,Cl2,Resolvent2),
        append(Resolvent1,Resolvent2,RList),
		sort(RList,Resolvent).

get_clauses([],RList,RList) :- !.
get_clauses([Pair|Clauses],RList,New) :-
        resolve(Pair,Resolvent),
        append(RList,[Resolvent],New1),
        get_clauses(Clauses,New1,New),!.
get_clauses([_|Clauses],RList,New) :-		
        get_clauses(Clauses,RList,New).

pairs(0,_,[]).
pairs(N,[X|Clauses],[X|Pair]) :-
    N > 0,
    N1 is N - 1,
    pairs(N1,Clauses,Pair).
pairs(N,[_|Clauses],Pair) :-
    N > 0,
    pairs(N,Clauses,Pair).
		
resolution(Clauses) :-
        findall(P,pairs(2,Clauses,P),Pairs),
        get_clauses(Pairs,[],New1),
		rem_dupl(New1,New),
        member([],New),
        write("Newly Generated Clauses: "),nl,write(New),nl,nl,
        write("Using Resolution-Refutation, Empty Clause is obtained,signifying that the original conclusion is true."),!.
resolution(Clauses) :-		
		findall(P,pairs(2,Clauses,P),Pairs),
        get_clauses(Pairs,[],New1),
		rem_dupl(New1,New),
        write("Newly Generated Clauses: "),nl,write(New),nl,nl,
        not(subset(New,Clauses)),
        append(Clauses,New,New_clause_list),
        write("New Clause(s): "),nl,write(New_clause_list),nl,nl,
        resolution(New_clause_list).

theorem_prover(Cl,Negation):-
		append(Cl,[Negation],Clauses1),
		rem_dupl(Clauses1,Clauses),
		nl,write("Initial Clause(s): "),nl,write(Clauses),nl,nl,
        resolution(Clauses).

append([],L,L):-!.
append([X|L1],L2,[X|L3]):-append(L1,L2,L3).

subset([],_):-!.
subset([H|T],L):-
	member(H,L),
	subset(T,L).

member(X,[X|_]).
member(X,[_|Rest]):-member(X,Rest).

rem_dupl([X],[X]):-!.
rem_dupl([H|T],L):-
	member(H,T),!,
	rem_dupl(T,L).
rem_dupl([H|T],[H|L]):-
	rem_dupl(T,L).

check_negation(X,Y) :-
		X = not(Y),!.
check_negation(X,not(Y)).

select(X,[X|L],L).
select(X,[H|T],[H|T1]) :-
        select(X,T,T1).