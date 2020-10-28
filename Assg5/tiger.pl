change(left,right).
change(right,left).

move([X,X,Goat,Cabbage],wolf,[Y,Y,Goat,Cabbage]) :- change(X,Y).
move([X,Wolf,X,Cabbage],goat,[Y,Wolf,Y,Cabbage]) :- change(X,Y).
move([X,Wolf,Goat,X],cabbage,[Y,Wolf,Goat,Y]) :- change(X,Y).
move([X,Wolf,Goat,Cabbage],nothing,[Y,Wolf,Goat,Cabbage]) :- change(X,Y).

safe([X,_,X,_]). % Goat is on the same bank as farmer.
safe([X,X,_,X]). % Wolf and cabbage are on the same bank as farmer

solution([right,right,right,right],[]).
solution(Config,[FirstMove|OtherMoves]) :-     
	move(Config,Move,NextConfig),     
	safe(NextConfig),     
	solution(NextConfig,OtherMoves).

tiger_cabbage():-
	solution([left,left,left,left],X).