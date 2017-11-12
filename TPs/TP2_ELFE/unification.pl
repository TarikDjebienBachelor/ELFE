%%%%%%%%%%%%%%% UNIFICATION %%%%%%%%%%%%%%%%

% I.Predicat d unification

% Question 1

% 1.

% ?- p(f(Y),W,g(Z)) = p(U,U,V).
% W = f(Y),
% U = f(Y),
% V = g(Z).

% 2.

% ?- p(f(Y),W,g(Z))=p(V,U,V).
% fail.
 
% 3.

% ?- p(a,X,f(g(Y)))=p(Z,h(Z,W),f(W)).
% X = h(a, g(Y)),
% Z = a,
% W = g(Y).

% 4.

% ?- p(a,g(X,Y),X)=p(W,Z,f(Z)).
% X = f(g(**, Y)),
% W = a,
% Z = g(f(**), Y).

% Question 2

unifie(X,Y):- =(X,Y).

% ?- unifie(nourriture(pain,X),nourriture(Y,saucisse)).
% X = saucisse,
% Y = pain.

% II. Occur-check

% Question 3

% ?- W=h(W,g(W)).
% W = h(**, g(**)).

% ?- set_prolog_flag(occurs_check,true).
% true.

% ?- W=h(W,g(W)).
% fail

% Question 4

% ?- X=f(X).
% fail.

% ?- set_prolog_flag(occurs_check,error).
% true.

% ?- X=f(X).
% ERROR: =/2: Cannot unify _G180 with f(_G180): would create an infinite tree

% III. Non-Unification

femme(mia).
femme(jody).
femme(yolande).
aime(vincent,mia).
aime(vincent,pierre).
aime(marcellus,mia).
aime('mon chou',lapin).
aime(lapin,'mon chou').

% Question 5

jaloux(X,Y):-aime(X,Z),aime(Y,Z),X\=Y.

% ?- jaloux(vincent,X).
% X = marcellus ;
% fail.


