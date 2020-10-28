last(X,[X]):-!.
last(X,[Y|Rest]):- last(X,Rest).