fitb([],[]).
fitb([H|T], [H|T1]) :- fitb(T,T1).
fitb([H|T], [_|T1]) :- H='.' , fitb(T,T1).
pwordle(_,[],_).
pwordle(P, [H | _], H) :- atom_chars(H, Characters), fitb(P, Characters).
pwordle(P, [_| Rest], W) :- pwordle(P, Rest, W).

wordle(L) :- write("Enter search term"), read(A), process(A, L).

process(stop,_) :- !.
process(A, L) :- atom_chars(A,T),pwordle(T,L,C), write(C), nl, wordle(L).
