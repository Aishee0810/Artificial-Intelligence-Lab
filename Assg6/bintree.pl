is_bt(nil).
is_bt(t(Left,Root,Right)):-
	is_bt(Left),
	is_bt(Right).