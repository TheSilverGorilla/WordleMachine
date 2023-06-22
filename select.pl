fitb([],[]).
fitb([H|T], [H|T1]) :- fitb(T,T1).
fitb([H|T], [_|T1]) :- H='.', fitb(T,T1).
pwordle(_,[],_).
pwordle(P, [H | _], H) :- atom_chars(H, Characters), fitb(P, Characters).
pwordle(P, [_| Rest], W) :- pwordle(P, Rest, W).
