inorder(nil, []).
inorder(bt(Left, X, Right), L) :-
	append(L1, [X|L2], L),
	inorder(Left, L1),
	inorder(Right, L2).

preorder(nil, []).
preorder(bt(Left, X, Right), L) :-
	append([X|L1], L2, L),
	preorder(Left, L1),
	preorder(Right, L2).

postorder(nil, []).
postorder(bt(Left, X, Right), L) :-
	append(L3, [X], L),
	append(L1, L2, L3),
	postorder(Left, L1),
	postorder(Right, L2).

get_preorder(In, Post, Pre) :-
	inorder(T, In),
	postorder(T, Post),
	preorder(T, Pre), !.