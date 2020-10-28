:-[insert].
:-[append].
tree_sort(L,L1):- 
	insert_tree(L,nil,T1),
	linearize(T1,L1).
insert_tree([],T,T):-!.
insert_tree([X|R],S,T) :-
        insert(X,S,T1),
		insert_tree(R,T1,T).
	
linearize(nil,[]):-!.
linearize(bst(Left,Root,Right),L):-
	linearize(Left,Lt),
	linearize(Right,Rt),
	append(Lt,[Root|Rt],L).