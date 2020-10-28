:-[insert].
treesort_del(L,L1):-
	insert_tree(L,nil,T),
	del_min(T,L1).
		
insert_tree([],T,T) :- !.
insert_tree([X|R],S,T) :-
        insert(X,S,T1),
		insert_tree(R,T1,T).
		
del_min(nil,[]) :- !.
del_min(T,[X|R]) :-
        del_bst(T,T1,X),
        del_min(T1,R).		
		
del_bst(bst(nil,X,Right),Right,X) :- !.
del_bst(bst(Left,Root,Right),bst(Left1,Root,Right),X) :-
        del_bst(Left,Left1,X).
